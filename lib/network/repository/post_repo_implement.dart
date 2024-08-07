import 'package:dummy_api_call_retrofit/model/request/login_request_model.dart';
import 'package:dummy_api_call_retrofit/model/response/products_response.dart';
import 'package:dummy_api_call_retrofit/network/repository/post_repository.dart';
import '../../core/locator/locator.dart';
import '../../model/response/category_response.dart';
import '../../model/response/customer_list_response.dart';
import '../data_source/api_utils.dart';

class PostRepositoryImpl extends PostRepository {
  @override
  Future<CategoryResponse> getCategories(LoginRequestModel request) {
    var response = postApi.getCategories(request);
    return response;
  }

  @override
  Future<CustomerResponse> getCustomers(LoginRequestModel request) {
    var response = postApi.getCustomers(request);
    return response;
  }

  @override
  Future<ProductsResponse> getProducts(LoginRequestModel request) {
    var response = postApi.getProducts(request);
    return response;
  }
}

PostRepositoryImpl postRepositoryImpl = locator<PostRepositoryImpl>();
