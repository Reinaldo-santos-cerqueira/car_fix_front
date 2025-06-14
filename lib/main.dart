import 'package:car_fix/pages/confirm_request/confirm_request_module.dart';
import 'package:car_fix/pages/home_client/home_client_module.dart';
import 'package:car_fix/pages/home_service_provider/home_service_provider_module.dart';
import 'package:car_fix/pages/login/login_module.dart';
import 'package:car_fix/pages/pre_login/pre_login_module.dart';
import 'package:car_fix/pages/search_provider_service/search_service_provider_module.dart';
import 'package:car_fix/pages/signup_client/signup_client_module.dart';
import 'package:car_fix/pages/signup_service_provider/signup_service_provider_module.dart';
import 'package:car_fix/pages/trade_password/change_password_module.dart';
import 'package:car_fix/pages/waiting_service_provider/waiting_service_provider_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Car fix",
      getPages: [
        ...PreLoginModule().routers,
        ...LoginModule().routers,
        ...SignUpClientModule().routers,
        ...SignUpServiceProviderModule().routers,
        ...ChangePasswordModule().routers,
        ...HomeServiceProviderModule().routers,
        ...HomeClientModule().routers,
        ...ConfirmRequestModule().routers,
        ...SearchServiceProviderModule().routers,
        ...WaitingServiceProviderModule().routers
      ],
      builder: EasyLoading.init(),
    );
  }
}
