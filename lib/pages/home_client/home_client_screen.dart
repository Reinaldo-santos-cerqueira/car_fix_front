import 'package:car_fix/components/buttons/primary_button.dart';
import 'package:car_fix/model/service_model.dart';
import 'package:car_fix/pages/home_client/home_client_controller.dart';
import 'package:car_fix/utils/get_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../model/confirm_request_arguments_model.dart';
import '../../utils/colors.dart';

class HomeClientScreen extends GetView<HomeClientController> {
  const HomeClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var getSize = GetSize();
    return Obx(
      () {
        return Scaffold(
          bottomNavigationBar: const GNav(
            backgroundColor: Colors.black,
            color: ColorsProject.white1,
            activeColor: ColorsProject.white1,
            gap: 10,
            tabMargin: EdgeInsets.symmetric(horizontal: 30),
            tabs: [
              GButton(
                icon: Icons.home,
                text: "Inicio",
              ),
              GButton(
                icon: Icons.list,
                text: "Historico",
              ),
            ],
          ),
          body: controller.loading.value
              ? const Center(
                  child: Text("Carregando..."),
                )
              : Stack(
                  children: [
                    FlutterMap(
                      mapController: controller.mapController,
                      options: MapOptions(
                        initialCenter: controller.currentPosition.value,
                        initialZoom: 17.0,
                        interactionOptions: const InteractionOptions(
                          flags: InteractiveFlag.none,
                        ),
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          subdomains: const ['a', 'b', 'c'],
                        ),
                        MarkerLayer(
                          markers: [
                            Marker(
                              width: 80.0,
                              height: 80.0,
                              point: controller.currentPosition.value,
                              child: const Icon(
                                Icons.location_on,
                                color: Colors.red,
                                size: 40.0,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: const BoxDecoration(
                            color: Color(0x88000000),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 20, left: 20, top: 100),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black38,
                              offset: Offset(5, 5),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: ColorsProject.white1,
                                size: 25.0,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  "${controller.street.value}, ${controller.neighborhood.value}",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: ColorsProject.white1),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight:
                                getSize.getHeightFromPercent(context, 40),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.listService.length,
                              itemBuilder: (context, index) {
                                ServiceModel service =
                                    controller.listService[index];
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      width: getSize.getWidthFromPercent(
                                          context, 90),
                                      child: ConstrainedBox(
                                        constraints: BoxConstraints(
                                          maxHeight:
                                              getSize.getHeightFromPercent(
                                                  context, 35),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Container(
                                            width: getSize.getWidthFromPercent(
                                                context, 80),
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                spacing: 20,
                                                children: [
                                                  Text(
                                                    service.title,
                                                    style: const TextStyle(
                                                      fontSize: 22,
                                                      color: Color(0xFFE1E1E1),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  RichText(
                                                    maxLines: 4,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    text: TextSpan(
                                                      children: <TextSpan>[
                                                        const TextSpan(
                                                          text: 'Descrição: ',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            color: Color(
                                                                0xFFE1E1E1),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: service
                                                              .description,
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 14,
                                                            color: Color(
                                                                0xFFE1E1E1),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      RichText(
                                                        maxLines: 4,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        text: TextSpan(
                                                          children: <TextSpan>[
                                                            const TextSpan(
                                                              text:
                                                                  'Valor do serviço: ',
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                color: Color(
                                                                    0xFFE1E1E1),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  " ${service.priceService.toStringAsFixed(2)}",
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 14,
                                                                color: Color(
                                                                    0xFFE1E1E1),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      RichText(
                                                        maxLines: 4,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        text: TextSpan(
                                                          children: <TextSpan>[
                                                            const TextSpan(
                                                              text:
                                                                  'Valor do KM:',
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                color: Color(
                                                                    0xFFE1E1E1),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  " ${service.priceKmTraveled.toStringAsFixed(2)}",
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 14,
                                                                color: Color(
                                                                    0xFFE1E1E1),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: PrimaryButton(
                                                        onPressed: () {
                                                          Get.toNamed(
                                                            '/confirm_request',
                                                            arguments:
                                                                ConfirmRequestArgumentsModel(
                                                              null,
                                                              serviceId:
                                                                  service.id,
                                                              latitude: controller
                                                                  .currentPosition
                                                                  .value
                                                                  .latitude,
                                                              longitude: controller
                                                                  .currentPosition
                                                                  .value
                                                                  .longitude,
                                                            ),
                                                          );
                                                        },
                                                        text: "Solicitar",
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        );
      },
    );
  }
}
