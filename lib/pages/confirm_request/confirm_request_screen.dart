import 'dart:math';

import 'package:car_fix/components/app_bar.dart';
import 'package:car_fix/components/buttons/primary_button.dart';
import 'package:car_fix/model/confirm_request_arguments_model.dart';
import 'package:car_fix/model/vehicle_model.dart';
import 'package:car_fix/pages/confirm_request/confirm_request_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';

class ConfirmRequestScreen extends GetView<ConfirmRequestController> {
  const ConfirmRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as ConfirmRequestArgumentsModel;

    return Obx(() {
      return Scaffold(
        backgroundColor: ColorsProject.blackPrimary,
        appBar: const AppBarCustom(title: ""),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.separated(
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 20,
                          );
                        },
                        itemCount: controller.vehicles.length,
                        shrinkWrap: true, // Adicionando shrinkWrap
                        itemBuilder: (context, index) {
                          VehicleModel vehicle = controller.vehicles[index];
                          return Obx(() {
                            return Container(
                              decoration: controller.vehicleSelect.value == vehicle.id
                                  ? BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.white54,
                                    blurRadius: 5.0,
                                    spreadRadius: 1,
                                  )
                                ],
                              )
                                  : BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black87,
                                    blurRadius: 1.0,
                                    spreadRadius: 1.0,
                                  )
                                ],
                              ),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(10),
                                onTap: () {
                                  controller.selectVehicle(vehicle.id!);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Transform.rotate(
                                        angle: pi / 4,
                                        child: const CircleAvatar(
                                          radius: 40,
                                          backgroundColor: Colors.transparent,
                                          child: Image(
                                              image: AssetImage(
                                                  "assets/images/icone_carro.png")),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            RichText(
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              text: TextSpan(
                                                children: <TextSpan>[
                                                  const TextSpan(
                                                    text: 'Modelo: ',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Color(0xFFE1E1E1),
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: vehicle.model,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Color(0xFFE1E1E1),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            // Marca
                                            RichText(
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              text: TextSpan(
                                                children: <TextSpan>[
                                                  const TextSpan(
                                                    text: 'Marca: ',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Color(0xFFE1E1E1),
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: vehicle.mark,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Color(0xFFE1E1E1),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            // Cor
                                            RichText(
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              text: TextSpan(
                                                children: <TextSpan>[
                                                  const TextSpan(
                                                    text: 'Cor: ',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Color(0xFFE1E1E1),
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: vehicle.color,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Color(0xFFE1E1E1),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            // Placa
                                            RichText(
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              text: TextSpan(
                                                children: <TextSpan>[
                                                  const TextSpan(
                                                    text: 'Placa: ',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Color(0xFFE1E1E1),
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: vehicle.plate,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Color(0xFFE1E1E1),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              PrimaryButton(
                onPressed: () {
                  controller.validVehicleAndGoToSearchServiceProvider(args);
                },
                text: "Selecione o carro ",
              ),
              const SizedBox(height: 20,)
            ],
          ),
        ),
      );
    });
  }
}

