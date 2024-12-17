import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController textEditingControllerPassword = TextEditingController();
  TextEditingController textEditingControllerEmail = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void goSignUp(){
    var type = Get.parameters['type'];
    if(type == 'client'){
      Get.toNamed('/signup_client');
    }else {
      Get.toNamed('/signup_service_provider');
    }
  }
}
