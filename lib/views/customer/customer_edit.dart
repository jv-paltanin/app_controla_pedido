import 'package:app_controla_pedido/helper/error.dart';
import 'package:app_controla_pedido/models/customer.dart';
import 'package:app_controla_pedido/repositories/customer_repository.dart';
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
    try {
      CustomerRepository repository = CustomerRepository();
      _customer = await repository.buscar(_id);
      _cpfController.text = _customer!.cpf;
      _nameController.text = _customer!.name;
      _lastnameController.text = _customer!.lastname;
    } catch (exception) {
      Error()
          .showError(context, "Erro recuperando cliente", exception.toString());
      Navigator.pop(context);
    }
  }

  void _salvar() async {
    _customer!.cpf = _cpfController.text;
    _customer!.name = _nameController.text;
    _customer!.lastname = _lastnameController.text;
    try {
      CustomerRepository repository = CustomerRepository();
      await repository.alterar(_customer!);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cliente editado com sucesso.')));
    } catch (exception) {
      Error().showError(context, "Erro editando cliente", exception.toString());
    }
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
