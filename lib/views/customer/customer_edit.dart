import 'package:app_controla_pedido/models/customer.dart';
import 'package:flutter/material.dart';

class CustomerEdit extends StatefulWidget {
  const CustomerEdit({super.key});

  @override
  _CustomerEditState createState() => _CustomerEditState();
}

class _CustomerEditState extends State<CustomerEdit> {
  final _formKey = GlobalKey<FormState>();
  final _cpfController = TextEditingController();
  final _nameController = TextEditingController();
  final _lastnameController = TextEditingController();
  late int _id = 0;
  Customer? _customer;

  @override
  void dispose() {
    _cpfController.dispose();
    _nameController.dispose();
    _lastnameController.dispose();
    super.dispose();
  }

  void _obterCliente() async {
    _customer = Customer(_id, "", "Customer ${_id}", "Sobrenome");

    _cpfController.text = _customer!.cpf;
    _nameController.text = _customer!.name;
    _lastnameController.text = _customer!.lastname;
  }

  void _salvar() async {
    _customer!.cpf = _cpfController.text;
    _customer!.name = _nameController.text;
    _customer!.lastname = _lastnameController.text;

    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cliente editado com sucesso.')));
  }

  Widget _buildForm(BuildContext context) {
    return Column(children: [
      Form(
          key: _formKey,
          child: ListView(shrinkWrap: true, children: [
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              const Text("CPF:"),
              Expanded(
                  child: TextFormField(
                controller: _cpfController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo não pode ser vazio';
                  }
                  return null;
                },
              ))
            ]),
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              const Text("Nome:"),
              Expanded(
                  child: TextFormField(
                controller: _nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo não pode ser vazio';
                  }
                  return null;
                },
              ))
            ]),
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              const Text("Sobrenome:"),
              Expanded(
                  child: TextFormField(
                controller: _lastnameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo não pode ser vazio';
                  }
                  return null;
                },
              ))
            ]),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _salvar();
                    }
                  },
                  child: const Text('Salvar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancelar'),
                ),
              ],
            )
          ])) // Form
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final Map m = ModalRoute.of(context)!.settings.arguments as Map;
    _id = m["id"];
    _obterCliente();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar Cliente"),
      ),
      body: _buildForm(context),
    );
  }
}
