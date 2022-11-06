import 'package:app_controla_pedido/data/dummy_customers.dart';
import 'package:app_controla_pedido/models/customer.dart';
import 'package:flutter/cupertino.dart';

class Customers with ChangeNotifier {
  final Map<String, Customer> _items = {...dummyCustomers};

  List<Customer> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Customer byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Customer customer) {
    if (customer == null) {
      return;
    }

    if (customer.id != null &&
        customer.id!.trim().isNotEmpty &&
        _items.containsKey(customer.id)) {
      _items.update(
          customer.id!,
          (_) => Customer(
              id: customer.id,
              cpf: customer.cpf,
              name: customer.name,
              lastname: customer.lastname));
    } else {
      _items.putIfAbsent(
          customer.cpf,
          () => Customer(
              cpf: customer.cpf,
              name: customer.name,
              lastname: customer.lastname));
    }

    notifyListeners();
  }

  void remove(String id) {
    _items.remove(id);
    notifyListeners();
  }
}
