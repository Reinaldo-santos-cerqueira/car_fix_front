class AddressModel {
  final String neighborhood;
  final String street;
  final String number;
  final String city;
  final String state;
  final String cep;
  final String? complement;

  AddressModel({
    required this.neighborhood,
    required this.street,
    required this.number,
    required this.city,
    required this.state,
    required this.cep,
    this.complement,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      neighborhood: json['neighborhood'],
      street: json['street'],
      number: json['number'],
      city: json['city'],
      state: json['state'],
      cep: json['cep'],
      complement: json['complement'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'neighborhood': neighborhood,
      'street': street,
      'number': number,
      'city': city,
      'state': state,
      'cep': cep,
      'complement': complement,
    };
  }
}
