import 'package:app_controla_pedido/src/models/customer_model.dart';
import 'package:dio/dio.dart';

class CustomerRepository {
  Dio dio = Dio();
  final path = 'http://localhost:8080/clientes';

  CustomerRepository([Dio? client]) : dio = client ?? Dio();

  Future<List<Customer>> fetchCustomers() async {
    final response = await dio.get(path);
    final list = response.data as List;
    return list.map((json) => Customer.fromJson(json)).toList();
  }
}
