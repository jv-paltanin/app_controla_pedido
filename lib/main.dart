import 'package:app_controla_pedido/provider/customers.dart';
import 'package:app_controla_pedido/routes/app_routes.dart';
import 'package:app_controla_pedido/views/customer_form.dart';
import 'package:app_controla_pedido/views/customer_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => Customers())],
      child: MaterialApp(
        title: 'App Top',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          AppRoutes.home: (_) => const CustomerList(),
          AppRoutes.customerForm: (_) => CustomerForm()
        },
      ),
    );
  }
}
