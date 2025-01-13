import 'package:car_fix/pages/login/login_controller.dart';
import 'package:car_fix/repository/user/user_repository.dart';
import 'package:car_fix/repository/user/user_repository_impl.dart';
import 'package:car_fix/service/user/user_service.dart';
import 'package:car_fix/service/user/user_service_impl.dart';
import 'package:get/get.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserRepository>(
      () => UserRepositoryImpl(),
      fenix: true,
    );

    Get.lazyPut<UserService>(
      () => UserServiceImpl(
        userRepository: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut(
      () => LoginController(
        userService: Get.find(),
      ),
    );
  }
}
