import 'package:car_fix/service/user/user_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  final UserService userService;
  ChangePasswordController({required this.userService});

  final currentStep = 0.obs;
  final loadingBtn = false.obs;
  final formKeyToken = GlobalKey<FormState>();
  final formKeyChangePassword = GlobalKey<FormState>();
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerToken = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();
  TextEditingController textEditingControllerConfirmPassword =
      TextEditingController();

  void onStepContinue() {
    if (currentStep.value == 0) {
      if (!formKeyToken.currentState!.validate()) {
        return;
      } else {
        userService.generateToken(
            currentStep, textEditingControllerEmail.text, loadingBtn);
      }
    } else if (currentStep.value == 1) {
      if (!formKeyChangePassword.currentState!.validate()) {
        return;
      } else {
        userService.changePassword(
          textEditingControllerToken.text,
          textEditingControllerPassword.text,
          textEditingControllerEmail.text,
          loadingBtn,
        );
      }
    }
  }

  void onStepCancel() {
    if (currentStep.value == 0) {
      Get.back();
    } else if (currentStep.value > 0) {
      currentStep(currentStep.value - 1);
    }
  }
}
