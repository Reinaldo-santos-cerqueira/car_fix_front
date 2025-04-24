import 'package:car_fix/components/page_basic.dart';
import 'package:car_fix/components/steps_form/steps_form_service.dart';
import 'package:car_fix/components/steps_form/steps_form_vehicle.dart';
import 'package:car_fix/pages/signup_service_provider/signup_service_provider_controller.dart';
import 'package:car_fix/components/steps_form/steps_form_personal.dart';
import 'package:car_fix/components/steps_form/steps_form_address.dart';
import 'package:car_fix/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpServiceProviderScreen
    extends GetView<SignUpServiceProviderController> {
  const SignUpServiceProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageBasic(
      canGoBack: true,
      body: Obx(() {
        return Stepper(
          currentStep: controller.currentStep.value,
          onStepContinue: controller.onStepContinue,
          onStepCancel: controller.onStepCancel,
          type: StepperType.vertical,
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return Container(
              margin: const EdgeInsets.only(top: 20),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
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
                    Expanded(
                      child: ElevatedButton(
                        onPressed: details.onStepContinue,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsProject.greenPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text(
                          controller.currentStep.value == 3 ? "Enviar" : "Continuar",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
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
                "Pessoais",
                style: TextStyle(color: Colors.white),
              ),
              content: StepsFormPersonal(
                typeServiceProvider: true,
                controller: controller,
              ),
            ),
            Step(
              state: controller.currentStep > 1
                  ? StepState.complete
                  : StepState.indexed,
              isActive: controller.currentStep.value >= 1,
              title: const Text(
                "Endereço",
                style: TextStyle(color: Colors.white),
              ),
              content: StepsFormAddress(
                controller: controller,
              ),
            ),
            Step(
              state: controller.currentStep > 2
                  ? StepState.complete
                  : StepState.indexed,
              isActive: controller.currentStep.value >= 2,
              title: const Text(
                "Veiculo",
                style: TextStyle(color: Colors.white),
              ),
              content: StepsFormVehicle(
                controller: controller,
              ),
            ),
            Step(
              state: controller.currentStep > 3
                  ? StepState.complete
                  : StepState.indexed,
              isActive: controller.currentStep.value == 3,
              title: const Text(
                "Serviço",
                style: TextStyle(color: Colors.white),
              ),
              content: const StepsFormService(),
            ),
          ],
        );
      }),
    );
  }
}
