import 'package:car_fix/model/service_provider_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

abstract class ServiceProviderService {
  Future<String?> create(ServiceProviderModel clientData, XFile imageFileCnh,  XFile imageFileDocumentVehicle,BuildContext context, Rx<bool> loadingBtn);
}
