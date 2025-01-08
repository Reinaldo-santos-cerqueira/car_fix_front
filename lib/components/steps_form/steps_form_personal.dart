import 'package:car_fix/components/inputs/text_form_field_custom.dart';
import 'package:car_fix/components/inputs/text_form_field_password_custom.dart';
import 'package:car_fix/components/inputs/text_form_field_withou_icon_custom.dart';
import 'package:car_fix/components/pickers/picker_image.dart';
import 'package:car_fix/utils/masks.dart';
import 'package:car_fix/utils/validator_custom.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class StepsFormPersonal extends StatelessWidget {
  final bool typeServiceProvider;
  final controller;
  const StepsFormPersonal(
      {super.key, required this.typeServiceProvider, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKeyPersonal,
      child: Column(
        children: [
          TextFormFieldCustom(
            controller: controller.textEditingControllerFullName,
            icon: Icons.person,
            hintText: 'Digite seu nome completo',
            validator: Validatorless.multiple([
              Validatorless.required("Nome é obrigatorio"),
              Validatorless.max(255, "Digite no maximo 255 caracteres"),
              Validatorless.min(5, "Digite no minimo 5 caracteres")
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormFieldCustom(
            controller: controller.textEditingControllerEmail,
            icon: Icons.mail,
            hintText: 'Digite seu email',
            validator: Validatorless.multiple(
              [
                Validatorless.email("Digite um email valido"),
                Validatorless.required("Email é obrigatorio")
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormFieldCustom(
            controller: controller.textEditingControllerPhoneNumber,
            textInputType: TextInputType.number,
            icon: Icons.phone,
            maskFormatter: [maskFormatterPhone],
            hintText: 'Digite seu telefone',
            validator: Validatorless.multiple(
              [
                Validatorless.phone("Insira um telefone valido"),
                Validatorless.required("Insira um telefone valido")
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormFieldCustom(
            controller: controller.textEditingControllerIdentifier,
            icon: Icons.contact_mail,
            hintText: 'Digite seu cpf/cnpj',
            validator: Validatorless.multiple(
              [validateCPFouCNPJ],
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
              validator: Validatorless.multiple([
                Validatorless.regex(
                    RegExp(
                        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{10,}$'),
                    "Digite uma senha válida"),
                Validatorless.compare(controller.textEditingControllerPassword,
                    "As senhas devem ser iguais")
              ])),
          typeServiceProvider
              ? Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormWithoutIconFieldCustom(
                      controller: controller.textEditingControllerCnh,
                      hintText: 'Digite sua cnh',
                      validator: Validatorless.multiple([
                        Validatorless.min(11, "Digite uma cnh valida"),
                        Validatorless.max(11, "Digite uma cnh valida"),
                        Validatorless.required("Cnh é obrigatorio")
                      ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PickerImage(
                      txtError: controller.txtErrorCnh,
                      textBtn: controller.textBtnImgCnh,
                      file: controller.fileCnh,
                      filePath: controller.filePathCnh,
                    )
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
