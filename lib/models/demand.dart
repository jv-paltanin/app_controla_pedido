import 'package:app_controla_pedido/models/customer.dart';
import 'package:app_controla_pedido/models/item_demand.dart';

class Demand {
  int? id;
  String data;
  Customer customer;
  List<ItemDemand> items = [];

  Demand(this.id, this.data, this.customer, this.items);
  Demand.newDemand(this.data, this.customer, this.items);
}
