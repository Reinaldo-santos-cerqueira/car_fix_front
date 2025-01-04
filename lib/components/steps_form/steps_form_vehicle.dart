import 'package:car_fix/components/inputs/text_form_field_withou_icon_custom.dart';
import 'package:car_fix/components/pickers/picker_image.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class StepsFormVehicle extends StatelessWidget {
  final controller;
  const StepsFormVehicle({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: controller.formKeyVehicle,
        child: Column(
          children: [
            TextFormWithoutIconFieldCustom(
              controller: controller.textEditingControllerModel,
              hintText: 'Digite o veiculo',
              validator: Validatorless.multiple([
                Validatorless.required("Digite um veiculo"),
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormWithoutIconFieldCustom(
              controller: controller.textEditingControllerMark,
              hintText: 'Digite a marca',
              validator: Validatorless.multiple([
                Validatorless.required("Digite uma marca"),
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormWithoutIconFieldCustom(
              controller: controller.textEditingControllerPlate,
              hintText: 'Digite a placa',
              validator: Validatorless.multiple([
                Validatorless.required("Digite a placa"),
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormWithoutIconFieldCustom(
              controller: controller.textEditingControllerColor,
              hintText: 'Digite a cor',
              validator: Validatorless.multiple([
                Validatorless.required("Digite a cor"),
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            PickerImage(
              txtError: controller.txtErrorDocumentVehicle,
              file: controller.fileDocumentVehicle,
              filePath: controller.filePathDocumentVehicle,
              textBtn: controller.textBtnImgDocumentVehicle,
            )
          ],
        ));
  }
}
