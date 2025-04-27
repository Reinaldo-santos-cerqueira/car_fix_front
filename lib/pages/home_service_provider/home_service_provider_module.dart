import 'package:car_fix/config/module.dart';
import 'package:car_fix/pages/home_service_provider/home_service_provider_bindings.dart';
import 'package:car_fix/pages/home_service_provider/home_service_provider_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class HomeServiceProviderModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/home_service_provider',
      page: () => const HomeServiceProviderScreen(),
      binding: HomeServiceProviderBindings(),
    ),
  ];
}
