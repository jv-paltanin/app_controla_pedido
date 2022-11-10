import 'package:app_controla_pedido/models/customer.dart';
import 'package:app_controla_pedido/provider/customers.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CustomerForm extends StatelessWidget {
  CustomerForm({super.key});

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(Customer customer) {
    _formData['id'] = customer.id!;
    _formData['cpf'] = customer.cpf;
    _formData['name'] = customer.name;
    _formData['lastname'] = customer.lastname;
  }

  @override
  Widget build(BuildContext context) {
    final customer = ModalRoute.of(context)!.settings.arguments as Customer;

    _loadFormData(customer);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Cliente'),
        actions: [
          IconButton(
              onPressed: () {
                bool isValid = _form.currentState!.validate();

                if (isValid) {
                  _form.currentState?.save();
                  Provider.of<Customers>(context, listen: false).put(Customer(
                    id: _formData['id'],
                    cpf: _formData['cpf']!,
                    name: _formData['name']!,
                    lastname: _formData['lastname']!,
                  ));
                  Navigator.of(context).pop();
                }
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                initialValue: UtilBrasilFields.obterCpf(_formData['cpf']!),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CpfInputFormatter(),
                ],
                decoration: const InputDecoration(labelText: 'CPF'),
                validator: (value) => !UtilBrasilFields.isCPFValido(value)
                    ? 'Informe um CPF válido'
                    : null,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onSaved: (value) => _formData['cpf'] = value!,
              ),
              TextFormField(
                initialValue: _formData['name'],
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) => value!.isEmpty
                    ? 'Informe o nome'
                    : value.length < 3
                        ? 'Nome inválido, mínimo de 3 carateres'
                        : null,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onSaved: (value) => _formData['name'] = value!,
              ),
              TextFormField(
                initialValue: _formData['lastname'],
                decoration: const InputDecoration(labelText: 'Sobrenome'),
                validator: (value) => value!.isEmpty
                    ? 'Informe o sobrenome'
                    : value.length < 3
                        ? 'Sobrenome inválido, mínimo de 3 carateres'
                        : null,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onSaved: (value) => _formData['lastname'] = value!,
              )
            ],
          ),
        ),
      ),
    );
  }
}
