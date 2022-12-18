import 'package:app_controla_pedido/helper/error.dart';
import 'package:app_controla_pedido/models/customer.dart';
import 'package:app_controla_pedido/repositories/customer_repository.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomerInsert extends StatefulWidget {
  const CustomerInsert({super.key});

  @override
  _CustomerInsertState createState() => _CustomerInsertState();
}

class _CustomerInsertState extends State<CustomerInsert> {
  final _formKey = GlobalKey<FormState>();
  final _cpfController = TextEditingController();
  final _nameController = TextEditingController();
  final _lastnameController = TextEditingController();

  @override
  void dispose() {
    _cpfController.dispose();
    _nameController.dispose();
    _lastnameController.dispose();
    super.dispose();
  }

  void _salvar() async {
    Customer customer = Customer.newCustomer(
        _cpfController.text, _nameController.text, _lastnameController.text);
    try {
      CustomerRepository repository = CustomerRepository();
      await repository.inserir(customer);
      _cpfController.clear();
      _nameController.clear();
      _lastnameController.clear();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Cliente salvo com sucesso.')));
    } catch (exception) {
      Error()
          .showError(context, "Erro inserindo cliente", exception.toString());
    }
  }

  Widget _buildForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CpfInputFormatter(),
              ],
              decoration: const InputDecoration(labelText: 'CPF'),
              validator: (value) => !UtilBrasilFields.isCPFValido(value)
                  ? 'Informe um CPF válido'
                  : null,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onSaved: (value) => _cpfController.text = value!,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nome'),
              validator: (value) => value!.isEmpty
                  ? 'Informe o nome'
                  : value.length < 3
                      ? 'Nome inválido, mínimo de 3 carateres'
                      : null,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onSaved: (value) => _nameController.text = value!,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Sobrenome'),
              validator: (value) => value!.isEmpty
                  ? 'Informe o sobrenome'
                  : value.length < 3
                      ? 'Sobrenome inválido, mínimo de 3 carateres'
                      : null,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onSaved: (value) => _lastnameController.text = value!,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _salvar();
                    }
                  },
                  child: const Text('Salvar'),
                ),
              ],
            )
          ]),
        ) // Form
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Novo Cliente"),
      ),
      body: _buildForm(context),
    );
  }
}
