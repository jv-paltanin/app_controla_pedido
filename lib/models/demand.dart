import 'package:app_controla_pedido/models/customer.dart';
import 'package:app_controla_pedido/models/item_demand.dart';

class Demand {
  final String id;
  final String data;
  final Customer customer;
  List<ItemDemand> items = [];

  Demand({
    required this.id,
    required this.data,
    required this.customer,
    required this.items,
  });
}
