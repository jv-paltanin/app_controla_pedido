import 'package:app_controla_pedido/views/customer_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Top',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CustomerList(),
    );
  }
}
