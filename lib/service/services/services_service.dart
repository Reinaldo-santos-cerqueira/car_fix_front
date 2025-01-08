import 'package:car_fix/model/service_model.dart';
import 'package:flutter/widgets.dart';

abstract class ServicesService {
  Future<List<ServiceModel>?>  get(BuildContext context);
}