import 'package:car_fix/model/client_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

abstract class ClientService {
  Future<String?> create(ClientModel clientData, XFile imageFile,BuildContext context, Rx<bool> loadingBtn);
}
