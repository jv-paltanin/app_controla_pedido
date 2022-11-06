import 'package:app_controla_pedido/provider/customers.dart';
import 'package:app_controla_pedido/routes/app_routes.dart';
import 'package:app_controla_pedido/widgets/customer_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomerList extends StatelessWidget {
  const CustomerList({super.key});

  @override
  Widget build(BuildContext context) {
    final Customers customers = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.customerForm);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
          itemCount: customers.count,
          itemBuilder: ((ctx, i) => CustomerTile(customers.byIndex(i)))),
    );
  }
}
