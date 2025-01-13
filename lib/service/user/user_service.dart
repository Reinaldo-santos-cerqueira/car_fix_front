import 'package:get/get.dart';

abstract class UserService {
  Future<String?> generateToken(
      RxInt currentStep, String email, RxBool loadingBtn);

}
