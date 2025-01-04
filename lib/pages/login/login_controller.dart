import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController textEditingControllerPassword = TextEditingController();
  TextEditingController textEditingControllerEmail = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var type = "".obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    type(Get.parameters['type']);
  }

  void goSignUp(){
    if(type.value == 'client'){
      Get.toNamed('/signup_client');
    }else {
      Get.toNamed('/signup_service_provider');
    }
  }
}
