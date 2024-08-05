import 'package:dummy_api_call_retrofit/core/db/app_db.dart';
import 'package:dummy_api_call_retrofit/local_db/dao/customer_dao.dart';
import 'package:dummy_api_call_retrofit/local_db/dao/product_dao.dart';
import 'package:dummy_api_call_retrofit/model/request/login_request_model.dart';
import 'package:dummy_api_call_retrofit/model/request/user_request_model.dart';
import 'package:dummy_api_call_retrofit/model/response/OrderItem.dart';
import 'package:dummy_api_call_retrofit/model/response/customer_response_model.dart';
import 'package:dummy_api_call_retrofit/notwork/store/post_store.dart';
import 'package:dummy_api_call_retrofit/screens/widgets/base_app_bar.dart';
import 'package:dummy_api_call_retrofit/screens/widgets/button_widget.dart';
import 'package:dummy_api_call_retrofit/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobx/mobx.dart';

import '../model/response/customer_with_product.dart';
import '../model/response/products_response.dart';
import '../values/style.dart';
import 'add_signature_page.dart';
import 'image_card.dart';
import 'order_details_page.dart';

class AddOrderPage extends StatefulWidget {
  const AddOrderPage({super.key});

  @override
  State<AddOrderPage> createState() => _AddOrderPageState();
}

class _AddOrderPageState extends State<AddOrderPage> {
  final _formKey = GlobalKey<FormState>();
  ValueNotifier<bool> isLoading = ValueNotifier(false);
  List<ReactionDisposer>? disposer;
  final ValueNotifier<int> _counter = ValueNotifier(0);
  TextEditingController qtyController = TextEditingController();
  ValueNotifier<Uint8List?> signature = ValueNotifier(null);

  final ValueNotifier<String?> _selectedCustomer = ValueNotifier(null);
  final ValueNotifier<String?> _selectedCategory = ValueNotifier(null);
  final ValueNotifier<String?> _selectedProduct = ValueNotifier(null);

  List<CustomerWithProduct> _orderList = [];
  List<Customer> _allCustomerList = [];
  List<Customer> _allCategoryList = [];
  List<Customer> _allProductList = [];
  final ValueNotifier<Customer?> _selectedCustomerData = ValueNotifier(null);
  final ValueNotifier<GetProductsResult?> _selectedProductData =
      ValueNotifier(null);

  final List<String> _customers = ['-- No Customer found --'];
  final List<String> _categories = ["-- No Categories found --"];
  final List<String> _products = ["-- No Product found --"];

  @override
  void initState() {
    super.initState();
    registerReactions();
    qtyController.text = _counter.value.toString();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _doApiCallAndDownloadData();
    });
  }

  void registerReactions() {
    disposer ??= [
      reaction((p0) => postStore.customerList, (list) {
        debugPrint("LIST_LIST : ${list.length}");
        if (list.isNotEmpty) {
          isLoading.value = false;
        }
      }),
      reaction((p0) => postStore.errorMessage, (errorMsg) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(errorMsg.toString())));
      })
    ];
  }

  void removeReactions() {
    if (disposer == null) {
      return;
    } else {
      for (var ele in disposer!) {
        ele.reaction.dispose();
      }
    }
  }

  @override
  void dispose() {
    removeReactions();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        centerTitle: false,
        showTitle: true,
        title: "Add Orders",
        titleWidgetColor: AppColor.white,
        leadingIcon: false,
        action: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const OrderDetailsScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12).r,
              child: const Icon(
                Icons.more_vert,
                color: AppColor.white,
              ),
            ),
          )
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: isLoading,
        builder: (context, value, child) {
          return value
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16).w,
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          10.verticalSpace,
                          _buildTotalUnitView(),
                          _buildCustomerDropDown(),
                          _buildItemCountView(),
                          10.verticalSpace,
                          _buildListHeaderView(),
                          _buildItemListView(),
                          10.verticalSpace,
                          _buildSignatureView(),
                          30.verticalSpace
                        ],
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }

  Widget _buildTotalUnitView() {
    return ValueListenableBuilder(
      valueListenable: _counter,
      builder: (context, value, child) {
        return Text(
          'Total Units : $value',
          style: textBold,
        );
      },
    );
  }

  Widget _buildListHeaderView() {
    return Container(
      color: AppColor.color575757,
      child: Row(
        children: [
          15.horizontalSpace,
          Expanded(
              child: Text(
            "Name",
            style: textSemiBold.copyWith(color: AppColor.white),
          )),
          Text(
            "Qty",
            style: textSemiBold.copyWith(color: AppColor.white),
          ),
          15.horizontalSpace,
        ],
      ),
    );
  }

  Widget _buildSignatureView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return const SignaturePage();
              },
            )).then(
              (value) {
                signature.value = value;
              },
            );
          },
          child: const Text('Tap to Signature'),
        ),
        10.horizontalSpace,
        ValueListenableBuilder(
            valueListenable: signature,
            builder: (context, value, child) {
              return SizedBox(
                width: 120.w,
                height: 100.h,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: signature.value == null
                      ? SizedBox()
                      : Image.memory(signature.value!),
                ),
              );
            }),
        10.horizontalSpace,
        Expanded(
          child: AppButton(
            "done",
            () {},
            child: const Icon(
              Icons.check,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildItemListView() {
    return _orderList.isEmpty
        ? SizedBox(
            height: 100.h,
            width: 1.sw,
            child: const Center(child: Text('No items added yet')))
        : ListView.builder(
            itemCount: _orderList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      _orderList[index].product.name.toString(),
                      style: textMedium,
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _orderList[index].qnt.toString(),
                          style: textMedium,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 1.h,
                    color: AppColor.color575757,
                  )
                ],
              );
            },
          );
  }

  Widget _buildItemCountView() {
    return Column(
      children: [
        10.verticalSpace,
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 100,
              child: ValueListenableBuilder(
                valueListenable: _counter,
                builder: (context, value, child) {
                  return TextField(
                    textAlign: TextAlign.center,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    readOnly: true,
                    cursorColor: AppColor.favColor,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColor.favColor),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColor.favColor),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColor.favColor),
                        ),
                        hintText: "Select Qty",
                        labelText: "Select Qty",
                        labelStyle: TextStyle(color: AppColor.favColor)),
                    keyboardType: TextInputType.number,
                    controller: qtyController,
                  );
                },
              ),
            ),
            10.horizontalSpace,
            Expanded(
              child: AppButton(
                "ADD",
                () {
                  _counter.value++;
                  qtyController.text = _counter.value.toString();
                },
              ),
            ),
            10.horizontalSpace,
            Expanded(
              child: AppButton(
                "SUB",
                () {
                  if (_counter.value > 0) {
                    _counter.value--;
                    qtyController.text = _counter.value.toString();
                  }
                },
              ),
            ),
            10.horizontalSpace,
            Expanded(
              child: AppButton("REM", () {
                _counter.value = 0;
                qtyController.text = _counter.value.toString();
              }),
            ),
          ],
        ),
        10.verticalSpace,
        AppButton(
          "Submit",
          () {
            if (_validate()) {
              CustomerWithProduct cwp = CustomerWithProduct(
                  DateTime.now().millisecondsSinceEpoch,
                  _selectedCustomerData.value!,
                  _selectedCategory.value!,
                  _selectedProductData.value!,
                  int.parse(qtyController.text));
              _orderList.add(cwp);
              _selectedCustomerData.value = null;
              _selectedCustomer.value = null;
              _selectedCategory.value = null;
              _selectedProductData.value = null;
              _selectedProduct.value = null;
              _counter.value = 0;
              qtyController.text = "0";
              setState(() {});
            }
          },
          width: 1.sw,
        )
      ],
    );
  }

  bool _validate() {
    if (_formKey.currentState!.validate()) {
      if (int.parse(qtyController.text) == 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Please add one or more than one item"),
          ),
        );
        return false;
      }
      return true;
    } else {
      return false;
    }
  }

  Widget _buildCustomerDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.verticalSpace,
        _customerListMenu(),
        10.verticalSpace,
        _categoryListMenu(),
        10.verticalSpace,
        _productListMenu()
      ],
    );
  }

  Widget _productListMenu() {
    //isloading ==true return prograss
    //else returu future
    return FutureBuilder(
      future: productsDao.findAllProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          _products.clear();
          return SizeBoxCenter(const CircularProgressIndicator());
        } else if (snapshot.hasError) {
          _products.clear();
          return SizeBoxCenter(Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          _products.clear();
          return SizeBoxCenter(const Text('No customers found.'));
        } else {
          _products.clear();
          postStore.productListFilter.forEach(
                (element) {
              _products.add("${element.name}  ||  ${element.productCategory}");
            },
          );
          return _buildDropdown('Select Product', _products, _selectedProduct,
                  (newValue) {
                _selectedProduct.value = newValue;
                _selectedProductData.value =
                    postStore.productListFilter.firstWhere(
                          (element) =>
                      newValue ==
                          "${element.name}  ||  ${element.productCategory}",
                    );
              });
        }
      },
    );
  }
  Widget SizeBoxCenter(Widget child1){
    return SizedBox(height: 100.h, width:1.sw,child: Center(child: child1));
  }

  Widget _categoryListMenu() {
    return Observer(
      builder: (context) {
        if (postStore.categoryList.isNotEmpty) {
          _categories.clear();
          _categories.addAll(postStore.categoryList);
        } else {}
        return _buildDropdown('Select Category', _categories, _selectedCategory,
            (newValue) {
          _selectedProduct.value = null;
          _selectedProductData.value = null;
          _selectedCategory.value = newValue;

          postStore.applyProductListFilter(newValue);
        });
      },
    );
  }

  Widget _customerListMenu() {
    debugPrint("SNAPSHOT --- findAllCustomers");
    return FutureBuilder(
      future: customerDao.findAllCustomers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          _customers.clear();
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          _customers.clear();
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          _customers.clear();
          return const Center(child: Text('No customers found.'));
        } else {
          _customers.clear();
          snapshot.data?.forEach(
            (element) {
              _allCustomerList.add(element);
              _customers.add(element.name!);
            },
          );
          return _buildDropdown(
              'Select Customer', _customers, _selectedCustomer, (newValue) {
            _selectedCustomer.value = newValue;
            _selectedCustomerData.value = _allCustomerList.firstWhere(
              (element) => element.name == newValue,
            );
          });
        }
      },
    );
  }

  Widget _buildDropdown(String label, List<String> items,
      ValueNotifier selectedValue, Function(String) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: textSemiBold,
        ),
        8.verticalSpace,
        ValueListenableBuilder(
          valueListenable: selectedValue,
          builder: (context, value, child) {
            return SizedBox(
              width: 1.sw,
              child: DropdownButtonFormField<String>(
                isExpanded: true,
                value: selectedValue.value,
                onChanged: (newValue) {
                  onChanged(newValue!);
                },
                validator: (value) {
                  if (label == "Select Customer" &&
                      (value == null || value.isEmpty)) {
                    return 'Please select customer';
                  }
                  if (label == "Select Category" &&
                      (value == null || value.isEmpty)) {
                    return 'Please select category';
                  }
                  if (label == "Select Product" &&
                      (value == null || value.isEmpty)) {
                    return 'Please select product';
                  }
                  return null;
                },
                items: items.map((item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      maxLines: 2,
                    ),
                  );
                }).toList(),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget observeResponse() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Observer(
        builder: (context) {
          if (isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else if (postStore.customerList.isEmpty) {
            return const Text("No Data found");
          } else {
            return ListView.builder(
              itemCount: postStore.customerList.length + 1,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (index < postStore.customerList.length) {
                  return ImageCard(
                    imageUrl: postStore.customerList[index].name!,
                    description: postStore.customerList[index].accountRef!,
                  );
                }
              },
            );
          }
        },
      ),
    );
  }

  void _doApiCallAndDownloadData() async {
    if (appHiveDb.firstTime) {
      isLoading.value = true;
      UserRequestModel userRequestModel = UserRequestModel(
          userName: "v",
          password: "v",
          deviceId: "355622080315528",
          active: true,
          appType: "Android",
          firstName: "Vinay",
          id: 3,
          lastName: "Patel",
          orderCode: "VIE",
          orderCount: 1,
          orderPredictionCount: 1,
          role: "Driver");
      LoginRequestModel requestModel = LoginRequestModel(
          user: userRequestModel,
          syncDate: "/Date(536436000-600)/",
          pageIndex: 0,
          appVersionNo: "1.0",
          deviceDate: "/Date(536436000-600)/");

      UserRequestModel userRequestModelCate = UserRequestModel(
          userName: "v",
          password: "v",
          deviceId: "7f2226495640ecb1",
          active: true,
          appType: "Mobile",
          firstName: "Vinay",
          id: 3,
          lastName: "Emu",
          orderCode: "VIE",
          orderCount: 98,
          orderPredictionCount: 19,
          isResetSync: false,
          role: "Driver");

      LoginRequestModel requestModelCate = LoginRequestModel(
          user: userRequestModelCate,
          appVersionNo: "20240715.14",
          deviceDate: "/Date(1721035961915+0530)/");

      LoginRequestModel requestModelProduct = LoginRequestModel(
          user: userRequestModelCate,
          syncDate: "/Date(536436000-600)/",
          pageIndex: 0,
          appVersionNo: "1.0",
          deviceDate: "/Date(1720768210-600)/");

      await postStore.getCustomerList(requestModel);
      await postStore.getCategoryList(requestModelCate);
      await postStore.getProductList(requestModelProduct);

      isLoading.value = false;
    }
  }
}
