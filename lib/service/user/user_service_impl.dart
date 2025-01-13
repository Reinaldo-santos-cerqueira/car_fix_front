import 'dart:convert';
import 'package:car_fix/exception/custom_exception.dart';
import 'package:car_fix/repository/user/user_repository.dart';
import 'package:car_fix/service/user/user_service.dart';
import 'package:car_fix/utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserServiceImpl implements UserService {
  final UserRepository userRepository;

  UserServiceImpl({required this.userRepository});

  @override
  Future<String?> generateToken(
      RxInt currentStep, String email, RxBool loadingBtn) async {
    BuildContext context = Get.context!;
    try {
      loadingBtn(true);
      http.Response response = await userRepository.generateToken(email);
      if (response.statusCode == 201) {
        currentStep(currentStep.value + 1);
        return "Success";
      } else if (response.statusCode == 400) {
        var responseData = jsonDecode(response.body);
        var errors = responseData['errors'];
        throw CustomException(errors);
      } else {
        throw CustomException('Erro desconhecido: ${response.statusCode}');
      }
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

  @override
  Future<String?> changePassword(
      String token, String password, String email, RxBool loadingBtn) async {
    BuildContext context = Get.context!;
    try {
      loadingBtn(true);
      http.Response response =
          await userRepository.changePassword(email, token, password);
      if (response.statusCode == 200) {
        showDialogSuccess(
          title: "Senha trocada com sucesso",
          context: context,
          onPressed: () {
            Get.back();
            Get.back();
          },
        );
        return "Success";
      } else if (response.statusCode == 400) {
        var responseData = jsonDecode(response.body);
        var errors = responseData['errors'];
        throw CustomException(errors);
      } else {
        throw CustomException('Erro desconhecido: ${response.statusCode}');
      }
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

    @override
  Future<String?> login( String password, String email, String tokenPhone, RxBool loadingBtn) async {
    BuildContext context = Get.context!;
    try {
      loadingBtn(true);
      http.Response response =
          await userRepository.login(email,password,tokenPhone);
      if (response.statusCode == 200) {
        showDialogSuccess(
          title: "Login efetuado com sucesso",
          context: context,
          onPressed: () {
            Get.back();
          },
        );
        return "Success";
      } else if (response.statusCode == 401 || response.statusCode == 401) {
        var responseData = jsonDecode(response.body);
        var errors = responseData['errors'];
        throw CustomException(errors);
      } else {
        throw CustomException('Erro desconhecido: ${response.statusCode}');
      }
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
}
