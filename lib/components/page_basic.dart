
import 'package:car_fix/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageBasic extends StatelessWidget {
  final Widget body;
  final bool canGoBack;
  const PageBasic({super.key, required this.body, required this.canGoBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: canGoBack ? IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ColorsProject.buttonPrimary,
          ),
        ) : null,
        backgroundColor: ColorsProject.blackPrimary,
      ),
      backgroundColor: ColorsProject.blackPrimary,
      body:(body)
    );
  }
}