class Customer {
  int? id;
  String cpf;
  String name;
  String lastname;

  Customer(this.id, this.cpf, this.name, this.lastname);
  Customer.newCustomer(this.cpf, this.name, this.lastname);
}
