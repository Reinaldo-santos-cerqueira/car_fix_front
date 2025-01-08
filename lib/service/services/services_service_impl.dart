import 'dart:convert';

import 'package:car_fix/exception/custom_exception.dart';
import 'package:car_fix/model/service_model.dart';
import 'package:car_fix/repository/services/services_repository.dart';
import 'package:car_fix/service/services/services_service.dart';
import 'package:car_fix/utils/dialogs.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class ServicesServiceImpl extends ServicesService{

  ServicesRepository servicesRepository;
  
  ServicesServiceImpl({required this.servicesRepository});

  @override
  Future<List<ServiceModel>?> get(BuildContext context) async {
    try {
      http.Response response  = await servicesRepository.get();
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((services)=> ServiceModel.fromJson(services)).toList();
      }else {
        throw CustomException('Erro desconhecido: ${response.statusCode}');
      }
    } catch (e) {
      showDialogError(context: context, title: e.toString());
      return  null;
    }
  }

}
