import 'package:dummy_api_call_retrofit/model/response/products_response.dart';

class CustomersOrderItems{
  String itemCategory;
  GetProductsResult product;
  int qnt;


  CustomersOrderItems(this.itemCategory,this.product,this.qnt);
}