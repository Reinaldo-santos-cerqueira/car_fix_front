import 'dart:convert';

import 'package:car_fix/exception/custom_exception.dart';
import 'package:car_fix/model/vehicle_model.dart';
import 'package:car_fix/repository/vehicle/vehicle_repository.dart';
import 'package:car_fix/service/vehicle/vehicle_service.dart';
import 'package:car_fix/utils/dialogs.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class VehicleServiceImpl extends VehicleService{

  VehicleRepository vehicleRepository;

  VehicleServiceImpl({required this.vehicleRepository});

  @override
  Future<List<VehicleModel>?> get(BuildContext context) async {
    try {
      http.Response response  = await vehicleRepository.get(await getToken());
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((vehicle)=> VehicleModel.fromJson(vehicle)).toList();
      }else {
        throw CustomException('Erro desconhecido: ${response.statusCode}');
      }
    } catch (e) {
      showDialogError(context: context, title: e.toString());
      return  null;
    }
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}
