import 'package:car_fix/pages/trade_password/change_password_controller.dart';
import 'package:car_fix/repository/user/user_repository.dart';
import 'package:car_fix/repository/user/user_repository_impl.dart';
import 'package:car_fix/service/user/user_service.dart';
import 'package:car_fix/service/user/user_service_impl.dart';
import 'package:get/get.dart';

class ChangePasswordBindings implements Bindings {
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
      () => ChangePasswordController(
        userService: Get.find(),
      ),
    );
  }
}
