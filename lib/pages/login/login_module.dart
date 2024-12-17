
import 'package:car_fix/config/module.dart';
import 'package:car_fix/pages/login/login_bindings.dart';
import 'package:car_fix/pages/login/login_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class LoginModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/login/:type',
      page: () => const LoginScreen(),
      binding: LoginBindings(),
    ),
  ];
}
