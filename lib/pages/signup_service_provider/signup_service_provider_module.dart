
import 'package:car_fix/config/module.dart';
import 'package:car_fix/pages/signup_service_provider/signup_service_provider_bindings.dart';
import 'package:car_fix/pages/signup_service_provider/signup_service_provider_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class SignUpServiceProviderModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/signup_service_provider',
      page: () => const SignUpServiceProviderScreen(),
      binding: SignUpServiceProviderBindings(),
    ),
  ];
}
