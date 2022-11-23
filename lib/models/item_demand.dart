import 'package:app_controla_pedido/models/product.dart';

class ItemDemand {
  String id;
  int quantity;
  Product product;

  ItemDemand({
    required this.id,
    required this.quantity,
    required this.product,
  });
}
