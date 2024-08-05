import 'package:dummy_api_call_retrofit/locator/locator.dart';
import 'package:floor/floor.dart';
import '../../model/response/customer_response_model.dart';


@dao
abstract class CustomerDao {
  @Query('SELECT * FROM Customer')
  Future<List<Customer>> findAllCustomers();

  @insert
  Future<void> insertCustomer(Customer customer);

  @update
  Future<void> updateCustomer(Customer customer);

  @delete
  Future<void> deleteCustomer(Customer customer);
}

CustomerDao customerDao = locator.get<CustomerDao>();

