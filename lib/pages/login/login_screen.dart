import 'package:car_fix/components/buttons/outlined_button_custom.dart';
import 'package:car_fix/components/buttons/primary_button.dart';
import 'package:car_fix/components/buttons/text_button_custom.dart';
import 'package:car_fix/components/inputs/text_form_field_custom.dart';
import 'package:car_fix/components/inputs/text_form_field_password_custom.dart';
import 'package:car_fix/components/page_basic.dart';
import 'package:car_fix/pages/login/login_controller.dart';
import 'package:car_fix/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return PageBasic(
      canGoBack: true,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            physics: isKeyboardOpen
                ? const AlwaysScrollableScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SafeArea(
                  maintainBottomViewPadding: true,
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextFormFieldCustom(
                          controller: controller.textEditingControllerEmail,
                          hintText: "Digite seu email",
                          icon: Icons.mail,
                          textInputType: TextInputType.emailAddress,
                          validator: Validatorless.multiple([
                            Validatorless.email("Digite um email valido"),
                            Validatorless.required("Email é requirido'")
                          ]),
                        ),
                        const SizedBox(height: 20),
                        TextFormFieldPasswordCustom(
                          controller: controller.textEditingControllerPassword,
                          hintText: "Digite sua senha",
                          icon: Icons.lock,
                          validator: Validatorless.regex(
                            RegExp(
                                r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{10,}$'),
                            "Digite uma senha válida",
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Text(
                              'Problemas para fazer login? ',
                              style:
                                  TextStyle(color: ColorsProject.buttonPrimary),
                            ),
                            TextButtonCustom(
                              onPressed: () {
                                Get.toNamed("/trade_password");
                              },
                              text: "Clique aqui",
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        PrimaryButton(
                          onPressed: () {
                            controller.login();
                          },
                          text: 'Login',
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                height: 1,
                                color: ColorsProject.buttonPrimary,
                              ),
                            ),
                            const SizedBox(width: 20),
                            const Text(
                              "OU",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorsProject.buttonPrimary,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Container(
                                height: 1,
                                color: ColorsProject.buttonPrimary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        OutlinedButtonCustom(
                          onPressed: () {
                            controller.goSignUp();
                          },
                          text: 'Cadastrar-se',
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
