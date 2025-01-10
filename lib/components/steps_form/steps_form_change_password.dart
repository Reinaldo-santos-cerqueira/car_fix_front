import 'package:car_fix/components/inputs/text_form_field_password_custom.dart';
import 'package:car_fix/components/inputs/text_form_field_withou_icon_custom.dart';
import 'package:car_fix/pages/trade_password/change_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

class StepsFormChangePassword extends StatelessWidget {
  const StepsFormChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChangePasswordController>();
    return Form(
      key: controller.formKeyChangePassword,
      child: Column(
        children: [
          TextFormWithoutIconFieldCustom(
            hintText: "Digite o token",
            controller: controller.textEditingControllerToken,
            validator: Validatorless.multiple(
              [Validatorless.required("Token é obrigatorio")],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormFieldPasswordCustom(
            controller: controller.textEditingControllerPassword,
            icon: Icons.lock,
            hintText: 'Digite sua senha',
            validator: Validatorless.regex(
              RegExp(
                  r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{10,}$'),
              "Digite uma senha válida",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormFieldPasswordCustom(
            controller: controller.textEditingControllerConfirmPassword,
            icon: Icons.lock,
            hintText: 'Confirme sua senha',
            validator: Validatorless.multiple(
              [
                Validatorless.regex(
                    RegExp(
                        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{10,}$'),
                    "Digite uma senha válida"),
                Validatorless.compare(controller.textEditingControllerPassword,
                    "As senhas devem ser iguais")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
