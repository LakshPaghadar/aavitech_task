import 'dart:io';

import 'package:dummy_api_call_retrofit/local_db/dao/category_dao.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../local_db/dao/customer_dao.dart';
import '../../local_db/dao/product_dao.dart';
import '../../local_db/database/app_database.dart';
import '../../network/api_client.dart';
import '../../network/repository/post_repo_implement.dart';
import '../../network/store/post_store.dart';
import '../db/app_db.dart';


GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
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
