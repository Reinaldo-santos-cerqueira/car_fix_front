import 'package:car_fix/components/buttons/outlined_button_custom.dart';
import 'package:car_fix/components/buttons/primary_button.dart';
import 'package:car_fix/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PreLoginScreen extends StatelessWidget {
  const PreLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg-pre-login.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topLeft, colors: [
            ColorsProject.blackPrimaryBgOpacityTop,
            ColorsProject.blackPrimaryBgOpacityBot,
          ])),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Você é?",
                  style: TextStyle(
                    color: ColorsProject.gray4,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                PrimaryButton(
                  onPressed: () {
                    Get.toNamed('/login/client');
                  },
                  text: "Cliente".toUpperCase(),
                ),
                const SizedBox(
                  height: 20,
                ),
                OutlinedButtonCustom(
                  onPressed: () {
                    Get.toNamed('/login/service_provider');
                  },
                  text: "Prestador de serviço".toUpperCase(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
