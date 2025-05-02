import 'dart:convert';
import 'package:car_fix/exception/custom_exception.dart';
import 'package:car_fix/model/service_provider_model.dart';
import 'package:car_fix/repository/service_provider/service_provider_repository.dart';
import 'package:car_fix/service/service_provider/service_provider_service.dart';
import 'package:car_fix/utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class ServiceProviderServiceImpl extends ServiceProviderService {
  final ServiceProviderRepository serviceProviderRepository;

  ServiceProviderServiceImpl({required this.serviceProviderRepository});

  @override
  Future<String?> create(
      ServiceProviderModel clientData,
      XFile imageFileCnh,
      XFile imageFileDocumentVehicle,
      XFile imageFileProfile,
      BuildContext context,
      Rx<bool> loadingBtn) async {
    try {
      loadingBtn(true);
      http.Response response = await serviceProviderRepository.create(
          clientData, imageFileCnh, imageFileDocumentVehicle, imageFileProfile);
      if (response.statusCode == 201) {
        showDialogSuccess(
            title: "Criado com sucesso",
            context: context,
            onPressed: () {
              Get.back();
              Get.back();
            });
        return "Success";
      }
      final responseData = jsonDecode(response.body);
      final errorMessage = _getErrorMessage(response.statusCode, responseData);
      throw CustomException(errorMessage);
    } catch (e) {
      if (e is CustomException) {
        showDialogError(context: context, title: e.message);
      } else {
        showDialogError(context: context, title: e.toString());
      }
      return null;
    } finally {
      loadingBtn(false);
    }
  }

  String _getErrorMessage(int statusCode, Map<String, dynamic> responseData) {
    switch (statusCode) {
      case 400:
        return responseData['errors']?.toString() ?? 'Erro de validação';
      case 409:
        return responseData['message']?.toString() ?? 'Usuário já existe';
      default:
        return 'Erro desconhecido: $statusCode';
    }
  }
}
