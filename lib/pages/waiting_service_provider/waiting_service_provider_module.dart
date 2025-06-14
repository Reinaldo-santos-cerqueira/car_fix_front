import 'package:car_fix/config/module.dart';
import 'package:car_fix/pages/waiting_service_provider/waiting_service_provider_bindings.dart';
import 'package:car_fix/pages/waiting_service_provider/waiting_service_provider_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class WaitingServiceProviderModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/waiting_service_provider',
      page: () => const WaitingServiceProviderScreen(),
      binding: WaitingServiceProviderBindings(),
    ),
  ];
}
