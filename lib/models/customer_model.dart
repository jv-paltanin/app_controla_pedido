class Customer {
  int? id;
  String? cpf;
  String? name;
  String? lastname;

  Customer({this.id, this.cpf, this.name, this.lastname});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cpf = json['cpf'];
    name = json['name'];
    lastname = json['lastname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cpf'] = cpf;
    data['name'] = name;
    data['lastname'] = lastname;
    return data;
  }
}
