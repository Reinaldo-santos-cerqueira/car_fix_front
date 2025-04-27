import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreLoginController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    loadTokenAndType();
  }

  void loadTokenAndType() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String? type = prefs.getString('type');
    if(token != null && token != ""){
      if(type == "client"){
        Get.offAllNamed("home_client");
      }else {
        Get.offAllNamed("home_service_provider");
      }
    }
  }

  void goToLoginServiceProvider(){
      Get.toNamed('/login/service_provider');
  }

  void goToLoginClient(){
    Get.toNamed('/login/client');
  }

}
