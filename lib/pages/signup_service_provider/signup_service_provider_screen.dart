import 'package:car_fix/components/page_basic.dart';
import 'package:car_fix/pages/signup_client/signup_client_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpServiceProviderScreen extends GetView<SignUpClientController> {
  const SignUpServiceProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageBasic(
      canGoBack: true,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Text('Client')],
        ),
      ),
    );
  }
}
