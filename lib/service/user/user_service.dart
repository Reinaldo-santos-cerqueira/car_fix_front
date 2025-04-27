import 'package:car_fix/model/login_model.dart';
import 'package:get/get.dart';

abstract class UserService {
  Future<String?> generateToken(
      RxInt currentStep, String email, RxBool loadingBtn);
  Future<String?> changePassword(
      String token, String password, String email, RxBool loadingBtn);
  Future<bool> login(LoginModel loginModel, RxBool loadingBtn);
}
