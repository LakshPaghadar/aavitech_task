// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PostStore on PostStoreBase, Store {
  late final _$customerListAtom =
      Atom(name: 'PostStoreBase.customerList', context: context);

  @override
  ObservableList<Customer> get customerList {
    _$customerListAtom.reportRead();
    return super.customerList;
  }

  @override
  set customerList(ObservableList<Customer> value) {
    _$customerListAtom.reportWrite(value, super.customerList, () {
      super.customerList = value;
    });
  }

  late final _$customerResponseAtom =
      Atom(name: 'PostStoreBase.customerResponse', context: context);

  @override
  Observable<CustomerResponse?> get customerResponse {
    _$customerResponseAtom.reportRead();
    return super.customerResponse;
  }

  @override
  set customerResponse(Observable<CustomerResponse?> value) {
    _$customerResponseAtom.reportWrite(value, super.customerResponse, () {
      super.customerResponse = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'PostStoreBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$categoryListAtom =
      Atom(name: 'PostStoreBase.categoryList', context: context);

  @override
  ObservableList<String> get categoryList {
    _$categoryListAtom.reportRead();
    return super.categoryList;
  }

  @override
  set categoryList(ObservableList<String> value) {
    _$categoryListAtom.reportWrite(value, super.categoryList, () {
      super.categoryList = value;
    });
  }

  late final _$categoryResponseAtom =
      Atom(name: 'PostStoreBase.categoryResponse', context: context);

  @override
  Observable<CategoryResponse?> get categoryResponse {
    _$categoryResponseAtom.reportRead();
    return super.categoryResponse;
  }

  @override
  set categoryResponse(Observable<CategoryResponse?> value) {
    _$categoryResponseAtom.reportWrite(value, super.categoryResponse, () {
      super.categoryResponse = value;
    });
  }

  late final _$productListAtom =
      Atom(name: 'PostStoreBase.productList', context: context);

  @override
  ObservableList<GetProductsResult> get productList {
    _$productListAtom.reportRead();
    return super.productList;
  }

  @override
  set productList(ObservableList<GetProductsResult> value) {
    _$productListAtom.reportWrite(value, super.productList, () {
      super.productList = value;
    });
  }

  late final _$productListFilterAtom =
      Atom(name: 'PostStoreBase.productListFilter', context: context);

  @override
  ObservableList<GetProductsResult> get productListFilter {
    _$productListFilterAtom.reportRead();
    return super.productListFilter;
  }

  @override
  set productListFilter(ObservableList<GetProductsResult> value) {
    _$productListFilterAtom.reportWrite(value, super.productListFilter, () {
      super.productListFilter = value;
    });
  }

  late final _$productResponseAtom =
      Atom(name: 'PostStoreBase.productResponse', context: context);

  @override
  Observable<ProductsResponse?> get productResponse {
    _$productResponseAtom.reportRead();
    return super.productResponse;
  }

  @override
  set productResponse(Observable<ProductsResponse?> value) {
    _$productResponseAtom.reportWrite(value, super.productResponse, () {
      super.productResponse = value;
    });
  }

  late final _$getCustomerListAsyncAction =
      AsyncAction('PostStoreBase.getCustomerList', context: context);

  @override
  Future<dynamic> getCustomerList(LoginRequestModel request) {
    return _$getCustomerListAsyncAction
        .run(() => super.getCustomerList(request));
  }

  late final _$getCategoryListAsyncAction =
      AsyncAction('PostStoreBase.getCategoryList', context: context);

  @override
  Future<dynamic> getCategoryList(LoginRequestModel request) {
    return _$getCategoryListAsyncAction
        .run(() => super.getCategoryList(request));
  }

  late final _$getProductListAsyncAction =
      AsyncAction('PostStoreBase.getProductList', context: context);

  @override
  Future<dynamic> getProductList(LoginRequestModel request) {
    return _$getProductListAsyncAction.run(() => super.getProductList(request));
  }

  late final _$PostStoreBaseActionController =
      ActionController(name: 'PostStoreBase', context: context);

  @override
  void applyProductListFilter(String cate) {
    final _$actionInfo = _$PostStoreBaseActionController.startAction(
        name: 'PostStoreBase.applyProductListFilter');
    try {
      return super.applyProductListFilter(cate);
    } finally {
      _$PostStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
customerList: ${customerList},
customerResponse: ${customerResponse},
errorMessage: ${errorMessage},
categoryList: ${categoryList},
categoryResponse: ${categoryResponse},
productList: ${productList},
productListFilter: ${productListFilter},
productResponse: ${productResponse}
    ''';
  }
}
