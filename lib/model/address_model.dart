import 'dart:convert';

class AddressModel {
  final String neighborhood;
  final String street;
  final String cep;
  final String state;
  final String city;

  AddressModel({
    required this.neighborhood,
    required this.street,
    required this.cep,
    required this.state,
    required this.city,
  });

  Map<String, dynamic> toMap() {
    return {
      'neighborhood': neighborhood,
      'street': street,
      'cep': cep,
      'state': state,
      'city': city,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      neighborhood: map['bairro'] ?? '',
      street: map['logradouro'] ?? '',
      cep: map['cep'] ?? '',
      state: map['estado'] ?? '',
      city: map['localidade'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) => AddressModel.fromMap(json.decode(source));
}
