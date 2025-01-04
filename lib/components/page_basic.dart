import 'package:car_fix/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageBasic extends StatelessWidget {
  final Widget body;
  final bool canGoBack;
  final String? parametersReturnScreen;
  const PageBasic(
      {super.key,
      required this.body,
      required this.canGoBack,
      this.parametersReturnScreen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: canGoBack
            ? IconButton(
                onPressed: () {
                  if (parametersReturnScreen != null) {
                    if (parametersReturnScreen == "client") {
                      Get.toNamed('/login/client');
                    } else {
                      Get.toNamed('/login/service_provider');
                    }
                  } else {
                    Get.back();
                  }
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: ColorsProject.buttonPrimary,
                ),
              )
            : null,
        backgroundColor: ColorsProject.blackPrimary,
      ),
      backgroundColor: ColorsProject.blackPrimary,
      body: Theme(
        data: ThemeData(
            canvasColor: ColorsProject.blackPrimary,
            colorScheme:
                const ColorScheme.light(primary: ColorsProject.greenPrimary)),
        child: body,
      ),
    );
  }
}
