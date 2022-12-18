import 'package:app_controla_pedido/models/customer.dart';
import 'package:app_controla_pedido/services/customer_rest.dart';

class CustomerRepository {
  final CustomerRest api = CustomerRest();
  Future<Customer> buscar(int id) async {
    return await api.buscar(id);
  }

  Future<List<Customer>> buscarTodos() async {
    return await api.buscarTodos();
  }

  Future<Customer> inserir(Customer customer) async {
    return await api.inserir(customer);
  }

  Future<Customer> alterar(Customer customer) async {
    return await api.alterar(customer);
  }

  Future<Customer> remover(int id) async {
    return await api.remover(id);
  }
}
