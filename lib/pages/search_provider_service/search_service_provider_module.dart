import 'package:car_fix/config/module.dart';
import 'package:car_fix/pages/search_provider_service/search_provider_bindings.dart';
import 'package:car_fix/pages/search_provider_service/search_service_provider_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class SearchServiceProviderModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/search_service_provider',
      page: () => const SearchServiceProviderScreen(),
      binding: SearchServiceProviderBindings(),
    ),
  ];
}
