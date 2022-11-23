// ignore_for_file: public_member_api_docs, sort_constructors_first
class Customer {
  final String? id;
  final String cpf;
  final String name;
  final String lastname;

  Customer({
    this.id,
    required this.cpf,
    required this.name,
    required this.lastname,
  });
}
