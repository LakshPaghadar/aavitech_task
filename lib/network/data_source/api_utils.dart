import 'package:dio/dio.dart';
import 'package:dummy_api_call_retrofit/locator/locator.dart';
import 'package:dummy_api_call_retrofit/model/response/post_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../model/request/login_request_model.dart';
import '../../model/response/category_response.dart';
import '../../model/response/customer_list_response.dart';
import '../../model/response/photos_response.dart';
import '../../model/response/products_response.dart';

part 'api_utils.g.dart';

@RestApi()
abstract class PostApi {
  factory PostApi(Dio dio) = _PostApi;
  @POST("/AndroidService.svc/GetCustomers")
  Future<CustomerResponse> getCustomers(@Body() LoginRequestModel request);

  @POST("/AndroidService.svc/GetCategories")
  Future<CategoryResponse> getCategories(@Body() LoginRequestModel request);

  @POST("/AndroidService.svc/GetProducts")
  Future<ProductsResponse> getProducts(@Body() LoginRequestModel request);

}

PostApi postApi = locator<PostApi>();
