import 'package:car_fix/components/page_basic.dart';
import 'package:car_fix/components/steps_form/steps_form_change_password.dart';
import 'package:car_fix/components/steps_form/steps_form_token.dart';
import 'package:car_fix/pages/trade_password/change_password_controller.dart';
import 'package:car_fix/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends GetView<ChangePasswordController> {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageBasic(
      canGoBack: true,
      body: Obx(
        () {
          return Stepper(
            currentStep: controller.currentStep.value,
            onStepContinue: controller.onStepContinue,
            onStepCancel: controller.onStepCancel,
            type: StepperType.vertical,
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              return Container(
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: details.onStepCancel,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsProject.redPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: const Text(
                          "Voltar",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Obx(() {
                      return Expanded(
                        child: ElevatedButton(
                          onPressed: details.onStepContinue,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsProject.greenPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: controller.loadingBtn.value
                              ? const CircularProgressIndicator(
                                  backgroundColor: ColorsProject.gray3,
                                )
                              : Text(
                                  controller.currentStep.value == 1
                                      ? "Trocar senha"
                                      : "Enviar token",
                                  style: const TextStyle(color: Colors.white),
                                ),
                        ),
                      );
                    })
                  ],
                ),
              );
            },
            steps: [
              Step(
                state: controller.currentStep > 0
                    ? StepState.complete
                    : StepState.indexed,
                isActive: controller.currentStep.value >= 0,
                title: const Text(
                  "Token",
                  style: TextStyle(color: Colors.white),
                ),
                content: const StepsFormToken(),
              ),
              Step(
                state: controller.currentStep > 1
                    ? StepState.complete
                    : StepState.indexed,
                isActive: controller.currentStep.value >= 1,
                title: const Text(
                  "Senha",
                  style: TextStyle(color: Colors.white),
                ),
                content: const StepsFormChangePassword(),
              ),
            ],
          );
        },
      ),
    );
  }
}
