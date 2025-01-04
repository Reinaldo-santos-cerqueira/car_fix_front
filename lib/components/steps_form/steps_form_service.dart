import 'package:car_fix/components/inputs/text_form_field_withou_icon_custom.dart';
import 'package:flutter/material.dart';

class StepsFormService extends StatelessWidget {
  final controller;
  const StepsFormService({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: controller.formKeyService,
        child: Column(
          children: [
            TextFormWithoutIconFieldCustom(
              controller: controller.textEditingControllerModel,
              hintText: 'Digite o veiculo',
              validator: null,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}
