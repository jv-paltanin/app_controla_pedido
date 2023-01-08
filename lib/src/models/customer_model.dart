class Customer {
  late int id;
  late String cpf;
  late String name;
  late String lastname;

  Customer(this.id, this.cpf, this.name, this.lastname);

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cpf = json['cpf'];
    name = json['nome'];
    lastname = json['sobrenome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cpf'] = cpf;
    data['nome'] = name;
    data['sobrenome'] = lastname;
    return data;
  }
}
