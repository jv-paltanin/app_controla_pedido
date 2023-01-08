import 'package:app_controla_pedido/src/controllers/customer_controller.dart';
import 'package:flutter/material.dart';

class CustomerListPage extends StatefulWidget {
  const CustomerListPage({super.key});

  @override
  State<CustomerListPage> createState() => _CustomerListPageState();
}

class _CustomerListPageState extends State<CustomerListPage> {
  final controller = CustomerController();

  _success() {
    return ListView.builder(
        itemCount: controller.customers.length,
        itemBuilder: (context, index) {
          var customer = controller.customers[index];
          return ListTile(
            title: Text(customer.name),
          );
        });
  }

  _error() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          controller.start();
        },
        child: const Text('Tente novamente'),
      ),
    );
  }

  _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  _start() {
    return Container();
  }

  stateManagement(CustomerState state) {
    switch (state) {
      case CustomerState.start:
        return _start();
      case CustomerState.loading:
        return _loading();
      case CustomerState.error:
        return _error();
      case CustomerState.success:
        return _success();
      default:
        return _start();
    }
  }

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
      ),
      body: AnimatedBuilder(
        animation: controller.state,
        builder: (context, child) {
          return stateManagement(controller.state.value);
        },
      ),
    );
  }
}
