
import 'package:car_fix/config/module.dart';
import 'package:car_fix/pages/pre_login/pre_login_bindings.dart';
import 'package:car_fix/pages/pre_login/pre_login_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class PreLoginModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/',
      page: () => const PreLoginScreen(),
      binding: PreLoginBindings(),
    ),
  ];
}
