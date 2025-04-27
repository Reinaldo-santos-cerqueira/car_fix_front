import 'package:car_fix/config/module.dart';
import 'package:car_fix/pages/home_client/home_client_bindings.dart';
import 'package:car_fix/pages/home_client/home_client_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class HomeClientModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/home_client',
      page: () => const HomeClientScreen(),
      binding: HomeClientBindings(),
    ),
  ];
}
