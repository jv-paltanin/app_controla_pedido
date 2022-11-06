import 'package:app_controla_pedido/data/dummy_customers.dart';
import 'package:app_controla_pedido/widgets/customer_tile.dart';
import 'package:flutter/material.dart';

class CustomerList extends StatelessWidget {
  const CustomerList({super.key});

  @override
  Widget build(BuildContext context) {
    const customers = {...dummyCustomers};

    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: ListView.builder(
          itemCount: customers.length,
          itemBuilder: ((context, i) =>
              CustomerTile(customers.values.elementAt(i)))),
    );
  }
}
