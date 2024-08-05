import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dummy_api_call_retrofit/local_db/dao/product_dao.dart';
import 'package:dummy_api_call_retrofit/locator/locator.dart';
import 'package:dummy_api_call_retrofit/model/response/category_response.dart';
import 'package:dummy_api_call_retrofit/model/response/products_response.dart';
import 'package:dummy_api_call_retrofit/notwork/repository/post_repo_implement.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../../core/db/app_db.dart';
import '../../local_db/dao/customer_dao.dart';
import '../../model/request/login_request_model.dart';
import '../../model/response/customer_list_response.dart';
import '../../model/response/customer_response_model.dart';
import '../../model/response/photos_response.dart';
import '../../model/response/post_response.dart';

part 'post_store.g.dart';

class PostStore = PostStoreBase with _$PostStore;

abstract class PostStoreBase with Store {

  @observable
  ObservableList<Customer> customerList = ObservableList();

  @observable
  Observable<CustomerResponse?> customerResponse=Observable(null);

  @observable
  String? errorMessage;

  @action
  Future getCustomerList(LoginRequestModel request) async {
    try {
      var res = await postRepositoryImpl.getCustomers(request);
      customerList.addAll(res.customers as Iterable<Customer>);
      _saveDataInCustomerTable();
      customerResponse.value=res;
    } on DioException catch (e) {
      if ((e.type == DioExceptionType.unknown &&
          (e.error is SocketException || e.error is HandshakeException)) || e.type == DioExceptionType.connectionError) {
        errorMessage = "No internet connection";
      } else {
        errorMessage = e.toString();
      }
    } catch (error, st) {
      errorMessage = error.toString();
      debugPrintStack(stackTrace: st);
    }
  }
  void _saveDataInCustomerTable() async {
    for (var customer in customerList){
      await customerDao.insertCustomer(customer);
    }
    appHiveDb.firstTime=false;
  }
  void _saveDataInProductTable() async {
    for (var product in productList){
      await productsDao.insertProduct(product);
    }
    appHiveDb.firstTime=false;
  }

  void _saveDataInCategoryTable() async {
    for (var category in categoryList){
      //await productsDao.insertProduct(category);
    }
    appHiveDb.firstTime=false;
  }

  //API 2
  @observable
  ObservableList<String> categoryList = ObservableList();

  @observable
  Observable<CategoryResponse?> categoryResponse=Observable(null);

  @action
  Future getCategoryList(LoginRequestModel request) async {
    try {
      var res = await postRepositoryImpl.getCategories(request);
      categoryList.addAll(res.getCategoriesResult);
      categoryResponse.value=res;
    } on DioException catch (e) {
      if ((e.type == DioExceptionType.unknown &&
          (e.error is SocketException || e.error is HandshakeException)) || e.type == DioExceptionType.connectionError) {
        errorMessage = "No internet connection";
      } else {
        errorMessage = e.toString();
      }
    } catch (error, st) {
      errorMessage = error.toString();
      debugPrintStack(stackTrace: st);
    }
  }

  //API 3
  @observable
  ObservableList<GetProductsResult> productList = ObservableList();

  @observable
  ObservableList<GetProductsResult> productListFilter = ObservableList();

  @observable
  Observable<ProductsResponse?> productResponse=Observable(null);

  @action
  Future getProductList(LoginRequestModel request) async {
    try {
      var res = await postRepositoryImpl.getProducts(request);
      productList.addAll(res.getProductsResult);
      productListFilter.addAll(res.getProductsResult);
      _saveDataInProductTable();
      productResponse.value=res;
    } on DioException catch (e) {
      if ((e.type == DioExceptionType.unknown &&
          (e.error is SocketException || e.error is HandshakeException)) || e.type == DioExceptionType.connectionError) {
        errorMessage = "No internet connection";
      } else {
        errorMessage = e.toString();
        debugPrint("ERROR"+e.toString());
      }
    } catch (error, st) {
      debugPrint("ERROR"+error.toString());
      errorMessage = error.toString();
      debugPrintStack(stackTrace: st);
    }
  }

  @action
  void applyProductListFilter(String cate) {
    productListFilter=ObservableList<GetProductsResult>.of(
      productList.where((product) => product.productCategory!.toLowerCase().contains(cate.toLowerCase())).toList()
    );
  }
}

final postStore = locator<PostStore>();
