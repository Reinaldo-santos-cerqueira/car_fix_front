import 'package:car_fix/components/inputs/text_form_field_withou_icon_custom.dart';
import 'package:car_fix/model/service_model.dart';
import 'package:car_fix/pages/signup_service_provider/signup_service_provider_controller.dart';
import 'package:car_fix/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StepsFormService extends StatefulWidget {
  const StepsFormService({super.key});

  @override
  State<StepsFormService> createState() => _StepsFormServiceState();
}

class _StepsFormServiceState extends State<StepsFormService> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignUpServiceProviderController>();
    return ListView.builder(
      itemCount: controller.listService.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        ServiceModel service = controller.listService[index];
        return Form(
          key: controller.listService[index].formKey,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Column(
                  children: [
                    CheckboxListTile(
                      side: BorderSide.none,
                      fillColor: WidgetStateProperty.all<Color>(
                        ColorsProject.greenPrimary,
                      ),
                      title: Text(
                        service.title,
                        style: const TextStyle(
                          color: ColorsProject.gray4,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(
                        service.description,
                        style: const TextStyle(
                          color: ColorsProject.gray3,
                          fontSize: 16,
                        ),
                      ),
                      value: service.isSelected,
                      onChanged: (bool? value) {
                        setState(() {
                          service.isSelected = value ?? false;
                        });
                      },
                    ),
                    AnimatedCrossFade(
                      firstChild: Container(height: 0,),
                      secondChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20,),
                          TextFormWithoutIconFieldCustom(
                            controller:
                                service.textEditingControllerPriceService!,
                            hintText: 'Digite o preço do serviço',
                            textInputType: TextInputType.number,
                            validator: (value) {
                              if (service.isSelected &&
                                  (value == null || value.isEmpty)) {
                                return 'Campo obrigatório';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          TextFormWithoutIconFieldCustom(
                            textInputType: TextInputType.number,
                            controller:
                                service.textEditingControllerPriceTraveled!,
                            hintText: 'Digite o valor cobrado por km',
                            validator: (value) {
                              if (service.isSelected &&
                                  (value == null || value.isEmpty)) {
                                return 'Campo obrigatório';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      crossFadeState: service.isSelected
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      duration: const Duration(milliseconds: 700),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
