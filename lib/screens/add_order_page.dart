import 'package:dummy_api_call_retrofit/core/db/app_db.dart';
import 'package:dummy_api_call_retrofit/local_db/dao/category_dao.dart';
import 'package:dummy_api_call_retrofit/local_db/dao/customer_dao.dart';
import 'package:dummy_api_call_retrofit/local_db/dao/product_dao.dart';
import 'package:dummy_api_call_retrofit/model/request/login_request_model.dart';
import 'package:dummy_api_call_retrofit/model/request/user_request_model.dart';
import 'package:dummy_api_call_retrofit/model/response/customer_response_model.dart';
import 'package:dummy_api_call_retrofit/screens/widgets/base_app_bar.dart';
import 'package:dummy_api_call_retrofit/screens/widgets/button_widget.dart';
import 'package:dummy_api_call_retrofit/screens/widgets/product_item_notifier.dart';
import 'package:dummy_api_call_retrofit/screens/widgets/signature_widget.dart';
import 'package:dummy_api_call_retrofit/screens/widgets/size_box_center_widget.dart';
import 'package:dummy_api_call_retrofit/utils/constants.dart';
import 'package:dummy_api_call_retrofit/values/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../model/response/customer_with_product.dart';
import '../model/response/products_response.dart';
import '../network/store/post_store.dart';
import '../values/style.dart';
import 'add_signature_page.dart';

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
  final ValueNotifier<Uint8List?> _signature = ValueNotifier(null);

  final ValueNotifier<String?> _selectedCustomer = ValueNotifier(null);
  final ValueNotifier<String?> _selectedCategory = ValueNotifier(null);
  final ValueNotifier<String?> _selectedProduct = ValueNotifier(null);

  final ValueNotifier<Customer?> _selectedCustomerData = ValueNotifier(null);
  final ValueNotifier<GetProductsResult?> _selectedProductData =
      ValueNotifier(null);
  final List<String> _customers = [];
  final List<String> _categories = [];
  final List<String> _products = [];

  @override
  void dispose() {
    isLoading.dispose();
    _counter.dispose();
    qtyController.dispose();
    _signature.dispose();
    _selectedCustomer.dispose();
    _selectedCategory.dispose();
    _selectedProduct.dispose();
    _selectedCustomerData.dispose();
    _selectedProductData.dispose();
    removeReactions();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    registerReactions();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _doApiCallAndDownloadData();
    });
    qtyController.addListener(_onQntChange);
  }
  void _onQntChange(){
    _counter.value = int.parse(qtyController.text);
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        centerTitle: false,
        showTitle: true,
        title: "Add Orders",
        titleWidgetColor: AppColor.white,
        leadingIcon: false,
        action: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12).r,
            child: const Icon(
              Icons.more_vert,
              color: AppColor.white,
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
    return Consumer<ProductItemNotifier>(
      builder: (BuildContext context, ProductItemNotifier value, Widget? child) {
        return Text(
          'Total Units : ${Provider.of<ProductItemNotifier>(context, listen: false).items.length}',
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
          onTap: _tapToSignatureClick,
          child: const Text('Tap to Signature'),
        ),
        10.horizontalSpace,
        ValueListenableBuilder(
            valueListenable: _signature,
            builder: (context, value, child) {
              return SignatureWidget(signature: _signature.value);
            }),
        10.horizontalSpace,
        Expanded(
          child: AppButton(
            "done",
            _onDoneClick,
            child: const Icon(
              Icons.check,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
  void _onDoneClick(){
    Constants.clearFocus();
    if (Provider.of<ProductItemNotifier>(context, listen: false).items.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please add atleast one product")));
    } else if (_signature.value==null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please add your signature")));
    } else {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => OrderDetailsScreen(signature: _signature.value,)));
    }
  }
  void _tapToSignatureClick(){
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return const SignaturePage();
      },
    )).then(
          (value) {
        _signature.value = value;
      },
    );
  }

  Widget _buildItemListView() {
    return Consumer<ProductItemNotifier>(
      builder:(context, provider, child) {
        return provider.items.isEmpty
            ? SizedBox(
                height: 100.h,
                width: 1.sw,
                child: const Center(child: Text('No items added yet')))
            : ListView.builder(
                itemCount: provider.items.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = provider.items[index];
                  return Column(
                    children: [
                      ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Product : ${item.product.name}",
                              style: textMedium,
                            ),
                            Text(
                              "Customer : ${item.customerData.name}",
                              style: textLight,
                            ),
                          ],
                        ),
                        trailing: Text(
                          item.qnt.toString(),
                          style: textMedium,
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
              width: 100.w,
              child: ValueListenableBuilder(
                valueListenable: _counter,
                builder: (context, value, child) {
                  return TextField(
                    textAlign: TextAlign.center,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    cursorColor: AppColor.favColor,
                    maxLength: 4,
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
              child: AppButton("ADD", _onAddClick,),
            ),
            10.horizontalSpace,
            Expanded(
              child: AppButton("SUB", _onSubClick,),
            ),
            10.horizontalSpace,
            Expanded(
              child: AppButton("REM", _onRemoveClick),
            ),
          ],
        ),
        10.verticalSpace,
      ],
    );
  }
  void _onAddClick(){
    Constants.clearFocus();
    if (_validate()) {
      CustomerWithProduct cwp = CustomerWithProduct(
          DateTime.now().millisecondsSinceEpoch,
          _selectedCustomerData.value!,
          _selectedCategory.value!,
          _selectedProductData.value!,
          int.parse(qtyController.text));

      Provider.of<ProductItemNotifier>(context, listen: false).addOrUpdateItem(cwp);
    }
  }
  void _onSubClick(){
    Constants.clearFocus();
    if (_counter.value > 0) {
      _counter.value--;
      qtyController.text = _counter.value.toString();
    }
  }
  void _onRemoveClick(){
    Constants.clearFocus();
    _selectedCustomerData.value = null;
    _selectedCustomer.value = null;
    _selectedCategory.value = null;
    _selectedProductData.value = null;
    _selectedProduct.value = null;
    _counter.value = 0;
    qtyController.text = "";
  }

  bool _validate() {
    if (_formKey.currentState!.validate()) {
      if (qtyController.text.isEmpty ||int.parse(qtyController.text) == 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Please add one or more than one item"),
          ),
        );
        return false;
      }
      if(int.parse(qtyController.text)>=10000){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Please add items less than 10000"),
          ),
        );
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
    return ValueListenableBuilder(
        valueListenable: _selectedCategory,
        builder: (context, value, child) {
          debugPrint("SNAPSHOT --- findAllProducts");
          return FutureBuilder(
            future: productsDao.findAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                _products.clear();
                return SizedBoxCenter(child1: const CircularProgressIndicator());
              } else if (snapshot.hasError) {
                _products.clear();
                return SizedBoxCenter(
                  child1: Text('Error: ${snapshot.error}'),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                _products.clear();
                return SizedBoxCenter(child1: const Text('No products found.'));
              } else {
                _products.clear();
                snapshot.data?.forEach(
                  (element) {
                    String cate = _selectedCategory.value.toString();
                    if (element.productCategory!
                            .toLowerCase()
                            .contains(cate.toLowerCase()) ==
                        true) {
                      _products.add(
                          "${element.name}  ||  ${element.productCategory}");
                    }
                  },
                );
                return _buildDropdown(
                    'Select Product', _products, _selectedProduct, (newValue) {
                  _selectedProduct.value = newValue;
                  _selectedProductData.value = snapshot.data?.firstWhere(
                    (element) =>
                        newValue ==
                        "${element.name}  ||  ${element.productCategory}",
                  );
                });
              }
            },
          );
        });
  }

  Widget _categoryListMenu() {
    debugPrint("SNAPSHOT --- findAllCategory");
    return FutureBuilder(
      future: categoryDao.findAllCategory(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          _categories.clear();
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          _categories.clear();
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          _categories.clear();
          return const Center(child: Text('No category found.'));
        } else {
          _categories.clear();
          snapshot.data?.forEach(
            (element) {
              _categories.add(element.name!);
            },
          );
          return _buildDropdown(
              'Select Category', _categories, _selectedCategory, (newValue) {
            _selectedProduct.value = null;
            _selectedProductData.value = null;
            _selectedCategory.value = newValue;
          });
        }
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
              _customers.add(element.name!);
            },
          );
          return _buildDropdown(
              'Select Customer', _customers, _selectedCustomer, (newValue) {
            _selectedCustomer.value = newValue;
            _selectedCustomerData.value = snapshot.data?.firstWhere(
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
