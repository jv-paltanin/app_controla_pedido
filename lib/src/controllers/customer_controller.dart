import 'package:app_controla_pedido/src/models/customer_model.dart';
import 'package:app_controla_pedido/src/repositories/customer_repository.dart';
import 'package:flutter/cupertino.dart';

class CustomerController {
  List<Customer> customers = [];
  final CustomerRepository _repository;
  final state = ValueNotifier<CustomerState>(CustomerState.start);

  CustomerController([CustomerRepository? repository])
      : _repository = repository ?? CustomerRepository();

  Future start() async {
    state.value = CustomerState.loading;
    try {
      customers = await _repository.fetchCustomers();
      state.value = CustomerState.success;
    } catch (e) {
      state.value = CustomerState.error;
    }
  }
}

enum CustomerState { start, loading, success, error }
