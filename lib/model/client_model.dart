import 'address_model.dart';
import 'vehicle_model.dart';

class ClientModel {
  final String fullName;
  final String phoneNumber;
  final String email;
  final String identifier;
  final String password;
  final String? tokenPhone;
  final String? tokenPasswordChange;
  final String? type;
  final String? addressId;
  final String? role;
  final AddressModel address;
  final VehicleModel vehicle;

  ClientModel({
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.identifier,
    required this.password,
    required this.address,
    required this.vehicle,
    this.tokenPhone,
    this.tokenPasswordChange,
    this.type,
    this.addressId,
    this.role,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      fullName: json['full_name'],
      phoneNumber: json['phone_number'],
      email: json['email'],
      identifier: json['identifier'],
      password: json['password'],
      tokenPhone: json['token_phone'],
      tokenPasswordChange: json['token_password_change'],
      type: json['type'],
      addressId: json['address_id'],
      role: json['role'],
      address: AddressModel.fromJson(json['address']),
      vehicle: VehicleModel.fromJson(json['vehicle']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'phone_number': phoneNumber,
      'email': email,
      'identifier': identifier,
      'password': password,
      'token_phone': tokenPhone,
      'token_password_change': tokenPasswordChange,
      'type': type,
      'address_id': addressId,
      'role': role,
      'address': address.toJson(),
      'vehicle': vehicle.toJson(),
    };
  }
}
