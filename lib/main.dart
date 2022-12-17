import 'package:app_controla_pedido/routes/routes.dart';
import 'package:app_controla_pedido/views/customer/customer_edit.dart';
import 'package:app_controla_pedido/views/customer/customer_insert.dart';
import 'package:app_controla_pedido/views/customer/customer_list.dart';
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
      home: const CustomerList(),
      routes: {
        Routes.customerList: (context) => const CustomerList(),
        Routes.customerInsert: (context) => const CustomerInsert(),
        Routes.customerEdit: (context) => const CustomerEdit(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const CustomerList(),
    );
  }
}
