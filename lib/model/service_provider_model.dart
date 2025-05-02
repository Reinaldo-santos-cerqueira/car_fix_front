import 'dart:convert';

import 'package:car_fix/model/client_model.dart';

class ServiceProviderModel {
  List<String> listServicesID;
  ClientModel userDto;
  String cnh;

  ServiceProviderModel({
    required this.listServicesID,
    required this.userDto,
    required this.cnh,
  });

  Map<String, dynamic> toJson() {
    return {
      'user_dto': userDto,
      'cnh': cnh,
      'services_id': listServicesID,
    };
  }

  String toJsonString() => json.encode(toJson());
}
