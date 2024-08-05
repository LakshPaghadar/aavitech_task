import 'dart:io';

import 'package:dummy_api_call_retrofit/local_db/dao/category_dao.dart';
import 'package:dummy_api_call_retrofit/notwork/api_client.dart';
import 'package:dummy_api_call_retrofit/notwork/repository/post_repo_implement.dart';
import 'package:dummy_api_call_retrofit/notwork/store/post_store.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../core/db/app_db.dart';
import '../local_db/dao/customer_dao.dart';
import '../local_db/dao/product_dao.dart';
import '../local_db/database/app_database.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  //register dio object and PostApi()
  await ApiClient.provideDio();
  final appDocumentDir = Platform.isAndroid
      ? await getApplicationDocumentsDirectory()
      : await getLibraryDirectory();

  Hive.init(appDocumentDir.path);

  locator.registerSingletonAsync<AppDB>(() => AppDB.getInstance());

  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  locator.registerSingleton<CustomerDao>(database.customerDao);
  locator.registerSingleton<GetProductsResultDao>(database.getProductsResultDao);
  locator.registerSingleton<CategoryDoa>(database.categoryDoa);

  locator.registerFactory(() => PostRepositoryImpl());
  locator.registerLazySingleton(() => PostStore());
}
