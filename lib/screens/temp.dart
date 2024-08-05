import 'package:flutter/material.dart';

class AddOrderPageTemp extends StatefulWidget {
  const AddOrderPageTemp({Key? key}) : super(key: key);

  @override
  State<AddOrderPageTemp> createState() => _AddOrderPageTempState();
}

class _AddOrderPageTempState extends State<AddOrderPageTemp> {
  final _formKey = GlobalKey<FormState>();
  final _customerController = TextEditingController();
  final _categoryController = TextEditingController();
  final _productController = TextEditingController();
  final _qtyController = TextEditingController(text: '2');
  List<Map<String, dynamic>> _cartItems = [];

  @override
  void dispose() {
    _customerController.dispose();
    _categoryController.dispose();
    _productController.dispose();
    _qtyController.dispose();
    super.dispose();
  }

  void _addItem() {
    final product = _productController.text;
    final qty = int.tryParse(_qtyController.text) ?? 1;
    if (product.isEmpty) return;
    setState(() {
      _cartItems.add({
        'name': product,
        'qty': qty,
      });
      _qtyController.text = '1';
    });
  }

  void _removeItem(int index) {
    setState(() {
      _cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Order'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Customer Selection
              TextFormField(
                controller: _customerController,
                decoration: const InputDecoration(
                  labelText: 'Select Customer',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a customer';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Category Selection
              TextFormField(
                controller: _categoryController,
                decoration: const InputDecoration(
                  labelText: 'Select Category',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a category';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Product Selection
              TextFormField(
                controller: _productController,
                decoration: const InputDecoration(
                  labelText: 'Select Product',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a product';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Quantity Selection
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _qtyController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Select Qty',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a quantity';
                        }
                        if (int.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  ElevatedButton(
                    onPressed: _addItem,
                    child: const Text('ADD'),
                  ),
                  const SizedBox(width: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_qtyController.text != '1') {
                        setState(() {
                          _qtyController.text = (int.tryParse(_qtyController.text) ?? 1 - 1).toString();
                        });
                      }
                    },
                    child: const Text('SUB'),
                  ),
                  const SizedBox(width: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_qtyController.text != '0') {
                        setState(() {
                          _qtyController.text = (int.tryParse(_qtyController.text) ?? 1 - 1).toString();
                        });
                      }
                    },
                    child: const Text('REM'),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),

              // Cart Items
              Expanded(
                child: _cartItems.isEmpty
                    ? const Center(child: Text('No items added yet'))
                    : ListView.builder(
                  itemCount: _cartItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_cartItems[index]['name']),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${_cartItems[index]['qty']}'),
                          IconButton(
                            onPressed: () => _removeItem(index),
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Submit the order
                    // ...
                    // Show confirmation dialog or navigate to next screen
                  }
                },
                child: const Text('Submit Order'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// return Observer(
//   builder: (context) {
//     if (postStore.customerList.isNotEmpty) {
//       _customers.clear();
//       postStore.customerList.forEach(
//         (element) {
//           _customers.add(element.name!);
//         },
//       );
//     } else {}
//     return _buildDropdown('Select Customer', _customers, _selectedCustomer,
//         (newValue) {
//       _selectedCustomer.value = newValue;
//       _selectedCustomerData.value = postStore.customerList.firstWhere(
//         (element) => element.name == newValue,
//       );
//     });
//   },
// );



// return Observer(
//   builder: (context) {
//     if (postStore.productListFilter.isNotEmpty) {
//       _products.clear();
//       postStore.productListFilter.forEach(
//         (element) {
//           _products.add("${element.name}  ||  ${element.productCategory}");
//         },
//       );
//     } else {}
//     return _buildDropdown('Select Product', _products, _selectedProduct,
//         (newValue) {
//       _selectedProduct.value = newValue;
//       _selectedProductData.value = postStore.productListFilter.firstWhere(
//         (element) =>
//             newValue == "${element.name}  ||  ${element.productCategory}",
//       );
//     });
//   },
// );