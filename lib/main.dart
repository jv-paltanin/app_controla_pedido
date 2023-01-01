import 'package:app_controla_pedido/src/routes/routes.dart';
import 'package:app_controla_pedido/src/views/customer_list_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Loja',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CustomerListPage(),
      routes: {
        Routes.customerList: (context) => const CustomerListPage(),
        Routes.customerInsert: (context) => const CustomerListPage(),
        Routes.customerEdit: (context) => const CustomerListPage(),
      },
    );
  }
}
