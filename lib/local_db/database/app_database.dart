import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import '../../model/response/category_dao_id.dart';
import '../../model/response/customer_response_model.dart';
import '../../model/response/products_response.dart';
import '../dao/category_dao.dart';
import '../dao/customer_dao.dart';
import '../dao/product_dao.dart';


part 'app_database.g.dart';

@Database(version: 1, entities: [Customer, GetProductsResult,CategoryWithId])
abstract class AppDatabase extends FloorDatabase {
  CustomerDao get customerDao;
  GetProductsResultDao get getProductsResultDao;
  CategoryDoa get categoryDoa;
}
