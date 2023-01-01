import 'package:app_controla_pedido/src/models/customer_model.dart';
import 'package:app_controla_pedido/src/repositories/customer_repository.dart';

class CustomerController {
  List<Customer> customers = [];
  final CustomerRepository _repository;
  CustomerState state = CustomerState.start;

  CustomerController([CustomerRepository? repository])
      : _repository = repository ?? CustomerRepository();

  Future start() async {
    state = CustomerState.loading;
    try {
      customers = await _repository.fetchCustomers();
      state = CustomerState.success;
    } catch (e) {
      state = CustomerState.error;
    }
  }
}

enum CustomerState { start, loading, success, error }
