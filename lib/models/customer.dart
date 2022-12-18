import 'dart:convert';

class Customer {
  int? id;
  String cpf;
  String name;
  String lastname;

  Customer(this.id, this.cpf, this.name, this.lastname);
  Customer.newCustomer(this.cpf, this.name, this.lastname);

  Map<String, dynamic> toMap() {
    return {
      'customer_id': id,
      'customer_cpf': cpf,
      'customer_name': name,
      'customer_lastname': lastname
    };
  }

  static Customer fromMap(Map<String, dynamic> map) {
    return Customer(
      map['customer_id'],
      map['customer_cpf'],
      map['customer_name'],
      map['customer_lastname'],
    );
  }

  static List<Customer> fromMaps(List<Map<String, dynamic>> maps) {
    return List.generate(maps.length, (i) {
      return Customer.fromMap(maps[i]);
    });
  }

  static Customer fromJson(String j) => Customer.fromMap(jsonDecode(j));

  static List<Customer> fromJsonList(String j) {
    final parsed = jsonDecode(j).cast<Map<String, dynamic>>();
    return parsed.map<Customer>((map) => Customer.fromMap(map)).toList();
  }

  String toJson() => jsonEncode(toMap());
}
