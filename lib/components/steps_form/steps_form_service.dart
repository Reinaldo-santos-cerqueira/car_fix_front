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
    return Obx(
      () => (
        ListView.builder(
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
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
