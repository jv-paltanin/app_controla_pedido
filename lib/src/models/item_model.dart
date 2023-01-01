import 'package:app_controla_pedido/src/models/product_model.dart';

class Item {
  int? id;
  int? quantity;
  Product? product;

  Item({this.id, this.quantity, this.product});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quantity'] = quantity;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}
