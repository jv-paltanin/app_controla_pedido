import 'package:app_controla_pedido/models/customer.dart';
import 'package:app_controla_pedido/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:brasil_fields/brasil_fields.dart';

class CustomerTile extends StatelessWidget {
  final Customer customer;

  const CustomerTile(this.customer, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        customer.id!,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      title: Text(
        '${customer.name} ${customer.lastname}',
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        UtilBrasilFields.obterCpf(customer.cpf),
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(AppRoutes.customerForm, arguments: customer);
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.orange,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete, color: Colors.red))
          ],
        ),
      ),
    );
  }
}
