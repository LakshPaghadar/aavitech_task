
import 'package:floor/floor.dart';
import '../../core/locator/locator.dart';
import '../../model/response/category_dao_id.dart';

@dao
abstract class CategoryDoa {
  @Query('SELECT * FROM CategoryWithId')
  Future<List<CategoryWithId>> findAllCategory();

  @insert
  Future<void> insertCategory(CategoryWithId product);

  @update
  Future<void> updateCategory(CategoryWithId product);

  @delete
  Future<void> deleteCategory(CategoryWithId product);
}

CategoryDoa categoryDao=locator.get<CategoryDoa>();