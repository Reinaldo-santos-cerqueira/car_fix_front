import 'package:car_fix/components/inputs/text_form_field_withou_icon_custom.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class StepsFormAddress extends StatelessWidget {
  final controller;
  const StepsFormAddress({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: controller.formKeyAddress,
        child: Column(
          children: [
            TextFormWithoutIconFieldCustom(
              controller: controller.textEditingControllerCep,
              hintText: 'Digite seu cep',
              validator: Validatorless.multiple([
                Validatorless.min(8, "Digite um cep valido"),
                Validatorless.required("Digite um cep valido"),
                Validatorless.max(8, "Digite um cep valido")
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormWithoutIconFieldCustom(
              controller: controller.textEditingControllerNeighborhood,
              hintText: 'Digite seu bairro',
              validator: Validatorless.multiple([
                Validatorless.required("Digite um bairro valido"),
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormWithoutIconFieldCustom(
              controller: controller.textEditingControllerNumber,
              hintText: 'Digite seu número',
              validator: Validatorless.multiple([
                Validatorless.required("Digite número valido"),
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormWithoutIconFieldCustom(
              controller: controller.textEditingControllerCity,
              hintText: 'Digite sua cidade',
              validator: Validatorless.multiple([
                Validatorless.required("Digite uma cidade valida"),
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormWithoutIconFieldCustom(
              controller: controller.textEditingControllerState,
              hintText: 'Digite seu estado',
              validator: Validatorless.multiple([
                Validatorless.required("Digite um estado valido"),
              ]),
            ),
          ],
        ));
  }
}
