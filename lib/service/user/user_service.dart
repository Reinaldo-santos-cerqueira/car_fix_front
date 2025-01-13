import 'package:get/get.dart';

abstract class UserService {
  Future<String?> generateToken(
      RxInt currentStep, String email, RxBool loadingBtn);
  Future<String?> changePassword(
      String token, String password, String email, RxBool loadingBtn);
  Future<String?> login(String password, String email,String tokenPhone, RxBool loadingBtn);
}
