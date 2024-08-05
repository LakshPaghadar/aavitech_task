import 'package:dummy_api_call_retrofit/model/response/products_response.dart';
import 'package:floor/floor.dart';

import 'customer_response_model.dart';
import 'customers_order_items.dart';


class CustomerWithProduct{


  final int id;
  Customer customerData;
  String itemCategory;
  GetProductsResult product;
  int qnt;

  CustomerWithProduct(this.id,this.customerData,this.itemCategory,this.product,this.qnt);
}