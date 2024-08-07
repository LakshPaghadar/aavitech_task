import 'package:dummy_api_call_retrofit/model/response/post_response.dart';

import '../../model/request/login_request_model.dart';
import '../../model/response/category_response.dart';
import '../../model/response/customer_list_response.dart';
import '../../model/response/photos_response.dart';
import '../../model/response/products_response.dart';

abstract class PostRepository {
  Future<CustomerResponse> getCustomers(LoginRequestModel request);
  Future<CategoryResponse> getCategories(LoginRequestModel request);
  Future<ProductsResponse> getProducts(LoginRequestModel request);

}
