import 'package:app_controla_pedido/models/customer_model.dart';
import 'package:app_controla_pedido/models/item_model.dart';

class Demand {
  int? id;
  String? data;
  Customer? customer;
  List<Item>? items;

  Demand({this.id, this.data, this.customer, this.items});

  Demand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    data = json['data'];
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    if (json['items'] != null) {
      items = <Item>[];
      json['items'].forEach((v) {
        items!.add(Item.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['data'] = this.data;
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
