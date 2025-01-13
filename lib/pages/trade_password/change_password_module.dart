
import 'package:car_fix/config/module.dart';
import 'package:car_fix/pages/trade_password/change_password_bindings.dart';
import 'package:car_fix/pages/trade_password/change_password_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class ChangePasswordModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/trade_password',
      page: () => const ChangePasswordScreen(),
      binding: ChangePasswordBindings(),
    ),
  ];
}
