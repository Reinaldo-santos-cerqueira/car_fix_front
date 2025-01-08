import 'dart:convert';

class ClientModel {
  final String fullName;
  final String phoneNumber;
  final String email;
  final String identifier;
  final String password;
  final String type;
  final String neighborhood;
  final String street;
  final String number;
  final String city;
  final String state;
  final String cep;
  final String plate;
  final String color;
  final String model;
  final String mark;

  ClientModel({
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.identifier,
    required this.password,
    required this.type,
    required this.neighborhood,
    required this.street,
    required this.number,
    required this.city,
    required this.state,
    required this.cep,
    required this.plate,
    required this.color,
    required this.model,
    required this.mark,
  });

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'email': email,
      'identifier': identifier,
      'password': password,
      'type': type,
      'neighborhood': neighborhood,
      'street': street,
      'number': number,
      'city': city,
      'state': state,
      'cep': cep,
      'plate': plate,
      'color': color,
      'model': model,
      'mark': mark,
    };
  }

  factory ClientModel.fromMap(Map<String, dynamic> map) {
    return ClientModel(
      fullName: map['fullName'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      email: map['email'] ?? '',
      identifier: map['identifier'] ?? '',
      password: map['password'] ?? '',
      type: map['type'] ?? '',
      neighborhood: map['neighborhood'] ?? '',
      street: map['street'] ?? '',
      number: map['number'] ?? '',
      city: map['city'] ?? '',
      state: map['state'] ?? '',
      cep: map['cep'] ?? '',
      plate: map['plate'] ?? '',
      color: map['color'] ?? '',
      model: map['model'] ?? '',
      mark: map['mark'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ClientModel.fromJson(String source) =>
      ClientModel.fromMap(json.decode(source));

  @override
  String toString() {
    return json.encode( toMap());
  }
}
