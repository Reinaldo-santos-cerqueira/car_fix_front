import 'package:car_fix/components/inputs/text_form_field_withou_icon_custom.dart';
import 'package:car_fix/pages/trade_password/change_password_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

class StepsFormToken extends StatelessWidget {
  const StepsFormToken({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChangePasswordController>();
    return Form(
      key: controller.formKeyToken,
      child: Column(
        children: [
          TextFormWithoutIconFieldCustom(
            hintText: "Digite o email",
            controller: controller.textEditingControllerEmail,
            validator: Validatorless.multiple(
              [
                Validatorless.email("Digite um email valido"),
                Validatorless.required("Email é obrigatorio")
              ],
            ),
          )
        ],
      ),
    );
  }
}
