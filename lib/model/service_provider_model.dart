import 'dart:convert';

import 'package:car_fix/model/client_model.dart';
import 'package:car_fix/model/service_model.dart';

class ServiceProviderModel {
  List<ServiceModelApiServiceProvider> listServicesID;
  ClientModel userDto;
  String cnh;

  ServiceProviderModel({
    required this.listServicesID,
    required this.userDto,
    required this.cnh,
  });

  Map<String, dynamic> toJson() {
    return {
      'userDto': userDto.toMap(),
      'cnh': cnh,
      'listServicesID': listServicesID.map((service) => service.toJson()).toList(),
    };
  }

  String toJsonString() => json.encode(toJson());
}
