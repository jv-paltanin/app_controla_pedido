import 'package:app_controla_pedido/models/customer.dart';
import 'package:app_controla_pedido/routes/routes.dart';
import 'package:flutter/material.dart';

class CustomerList extends StatefulWidget {
  const CustomerList({super.key});

  @override
  State<StatefulWidget> createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  List<Customer> _lista = <Customer>[];
  @override
  void initState() {
    super.initState();
    _refreshList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _refreshList() async {
    List<Customer> tempList = await _obterTodos();
    setState(() {
      _lista = tempList;
    });
  }

  Future<List<Customer>> _obterTodos() async {
    return <Customer>[
      Customer(1, '52693863058', 'João', 'Silva'),
      Customer(2, '88905526039', 'Elisa', 'Pereira'),
      Customer(4, '96241201026', 'Cleverson', 'Yun')
    ];
  }

  void _removerCustomer(int id) async {}

  void _showItem(BuildContext context, int index) {
    Customer customer = _lista[index];
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text(customer.name),
              content: Column(
                children: [
                  Text("CPF: ${customer.cpf}"),
                  Text("Nome: ${customer.name}"),
                  Text("Sobrenome: ${customer.lastname}"),
                ],
              ),
              actions: [
                TextButton(
                    child: const Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop(); // fecha a dialog
                    })
              ]);
        });
  }

  void _editItem(BuildContext context, int index) {
    Customer customer = _lista[index];
    Navigator.pushNamed(
      context,
      Routes.customerEdit,
      arguments: <String, int>{"id": customer.id!},
    );
  }

  void _removeItem(BuildContext context, int index) {
    Customer customer = _lista[index];
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text("Remover Cliente"),
              content: Text("Gostaria realmente de remover ${customer.name}?"),
              actions: [
                TextButton(
                  child: const Text("Não"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text("Sim"),
                  onPressed: () {
                    _removerCustomer(customer.id!);
                    _refreshList();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }

  ListTile _buildItem(BuildContext context, int index) {
    Customer customer = _lista[index];
    return ListTile(
      leading: Text(customer.id.toString()),
      title: Text(customer.name),
      subtitle: Text(customer.lastname),
      onTap: () {
        _showItem(context, index);
      },
      trailing: PopupMenuButton(
        itemBuilder: (context) {
          return [
            const PopupMenuItem(value: 'edit', child: Text('Editar')),
            const PopupMenuItem(value: 'delete', child: Text('Remover'))
          ];
        },
        onSelected: (String value) {
          if (value == 'edit') {
            _editItem(context, index);
          } else {
            _removeItem(context, index);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Clientes"), actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.customerInsert);
            },
            icon: const Icon(Icons.add))
      ]),
      body: ListView.builder(
        itemCount: _lista.length,
        itemBuilder: _buildItem,
      ),
      bottomNavigationBar: BottomNavigationBar(
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded), label: "Clientes"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.storefront), label: "Produtos"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: "Pedidos"),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, Routes.customerList);
              break;
            case 1:
              Navigator.pushNamed(context, Routes.productList);
              break;
            case 2:
              Navigator.pushNamed(context, Routes.demandList);
              break;
          }
        },
      ),
    );
  }
}
