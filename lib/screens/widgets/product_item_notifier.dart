import 'package:flutter/cupertino.dart';

import '../../model/response/customer_with_product.dart';

class ProductItemNotifier extends ChangeNotifier{
  final List<CustomerWithProduct> _items = [];

  List<CustomerWithProduct> get items => _items;

  void addOrUpdateItem(CustomerWithProduct item) {
    CustomerWithProduct? existingItem;
    for (var element in _items) {
      debugPrint("COMPARE:ELEMENT ${element.product.toString()}");
      debugPrint("COMPARE:ITEMMMM ${item.product.toString()} ");
      if (element.customerData == item.customerData &&
          element.itemCategory == item.itemCategory &&
          element.product == item.product) {
        existingItem = element;
        break;
      }
    }
    if (existingItem != null) {
      existingItem.qnt += item.qnt;
    } else {
      _items.add(item);
    }

    notifyListeners();
  }
}