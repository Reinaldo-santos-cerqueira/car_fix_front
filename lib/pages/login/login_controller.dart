import 'package:car_fix/model/login_model.dart';
import 'package:car_fix/service/user/user_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final UserService userService;

  LoginController({required this.userService});

  TextEditingController textEditingControllerPassword = TextEditingController();
  TextEditingController textEditingControllerEmail = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var type = "".obs;
  final loadingBtn = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    type(Get.parameters['type']);
  }

  void goSignUp() {
    if (type.value == 'client') {
      Get.toNamed('/signup_client');
    } else {
      Get.toNamed('/signup_service_provider');
    }
  }

  void login() {
    userService.login(
      LoginModel(
          email: textEditingControllerEmail.text,
          password: textEditingControllerPassword.text,
          tokenPhone: '123',
          type: type.value),
      loadingBtn,
    );
  }
}
