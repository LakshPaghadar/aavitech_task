import 'package:dummy_api_call_retrofit/locator/locator.dart';
import 'package:floor/floor.dart';
import '../../model/response/products_response.dart';


@dao
abstract class GetProductsResultDao {
  @Query('SELECT * FROM GetProductsResult')
  Future<List<GetProductsResult>> findAllProducts();

  @insert
  Future<void> insertProduct(GetProductsResult product);

  @update
  Future<void> updateProduct(GetProductsResult product);

  @delete
  Future<void> deleteProduct(GetProductsResult product);
}

GetProductsResultDao productsDao=locator.get<GetProductsResultDao>();