import 'package:car_fix/model/vehicle_model.dart';
import 'package:flutter/widgets.dart';

abstract class VehicleService {
  Future<List<VehicleModel>?>  get(BuildContext context);
}