import 'package:app_controla_pedido/models/customer.dart';
import 'package:app_controla_pedido/services/api.dart';
import 'package:http/http.dart' as http;

class CustomerRest {
  Future<Customer> buscar(int id) async {
    final http.Response response =
        await http.get(Uri.http(Api.endpoint, '/clientes/$id'));
    if (response.statusCode == 200) {
      return Customer.fromJson(response.body);
    } else {
      throw Exception(
          'Erro buscando cliente: $id [code: ${response.statusCode}]');
    }
  }

  Future<List<Customer>> buscarTodos() async {
    final http.Response response =
        await http.get(Uri.http(Api.endpoint, "clientes"));
    if (response.statusCode == 200) {
      return Customer.fromJsonList(response.body);
    } else {
      throw Exception('Erro buscando todos os clientes.');
    }
  }

  Future<Customer> inserir(Customer customer) async {
    final http.Response response =
        await http.post(Uri.http(Api.endpoint, 'clientes'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: customer.toJson());
    if (response.statusCode == 201) {
      return Customer.fromJson(response.body);
    } else {
      throw Exception('Erro inserindo cliente.');
    }
  }

  Future<Customer> alterar(Customer customer) async {
    final http.Response response = await http.put(
      Uri.http(Api.endpoint, 'clientes/${customer.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: customer.toJson(),
    );
    if (response.statusCode == 200) {
      return customer;
    } else {
      throw Exception('Erro alterando cliente ${customer.id}.');
    }
  }

  Future<Customer> remover(int id) async {
    final http.Response response = await http.delete(
        Uri.http(Api.endpoint, '/clientes/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode == 200) {
      return Customer.fromJson(response.body);
    } else {
      throw Exception('Erro removendo cliente: $id.');
    }
  }
}
