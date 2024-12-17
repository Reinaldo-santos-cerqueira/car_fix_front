
import 'package:car_fix/config/module.dart';
import 'package:car_fix/pages/signup_client/signup_client_bindings.dart';
import 'package:car_fix/pages/signup_client/signup_client_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class SignUpClientModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/signup_client',
      page: () => const SignUpClientScreen(),
      binding: SignUpClientBindings(),
    ),
  ];
}
