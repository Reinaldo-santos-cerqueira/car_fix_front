import 'package:car_fix/components/app_bar.dart';
import 'package:car_fix/components/buttons/primary_button.dart';
import 'package:car_fix/pages/search_provider_service/search_service_provider_controller.dart';
import 'package:car_fix/utils/url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';

class SearchServiceProviderScreen
    extends GetView<SearchServiceProviderController> {
  const SearchServiceProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: ""),
      backgroundColor: ColorsProject.blackPrimary,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Obx(
          () {
            return controller.listServiceRequestedAcceptProviderModel.isEmpty
                ? const Center(
                    child: Text("Procurando motoristas"),
                  )
                : ListView.separated(
                    itemCount: controller
                        .listServiceRequestedAcceptProviderModel.length,
                    itemBuilder: (context, index) {
                      var providerService = controller
                          .listServiceRequestedAcceptProviderModel[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    foregroundImage: NetworkImage(
                                        "$urlMain/${providerService.pathProfileImage}"),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Text(
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      providerService.fullName,
                                      style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: ColorsProject.white1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              RichText(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  children: <TextSpan>[
                                    const TextSpan(
                                      text: 'Modelo: ',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFFE1E1E1),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: providerService.vehicles[0].model,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFFE1E1E1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              RichText(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  children: <TextSpan>[
                                    const TextSpan(
                                      text: 'Marca: ',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFFE1E1E1),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: providerService.vehicles[0].mark,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFFE1E1E1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              RichText(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  children: <TextSpan>[
                                    const TextSpan(
                                      text: 'Placa: ',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFFE1E1E1),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: providerService.vehicles[0].plate,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFFE1E1E1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              RichText(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  children: <TextSpan>[
                                    const TextSpan(
                                      text: 'Color: ',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFFE1E1E1),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: providerService.vehicles[0].color,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFFE1E1E1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              RichText(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  children: <TextSpan>[
                                    const TextSpan(
                                      text: 'Distância: ',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFFE1E1E1),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "${providerService.distance} Km",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFFE1E1E1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              RichText(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  children: <TextSpan>[
                                    const TextSpan(
                                      text: 'Duração: ',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFFE1E1E1),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          "${providerService.duration} minutos",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFFE1E1E1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              RichText(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  children: <TextSpan>[
                                    const TextSpan(
                                      text: 'Valor total: ',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFFE1E1E1),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          "R\$ ${providerService.valueService.toStringAsFixed(2)}",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFFE1E1E1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              PrimaryButton(
                                  onPressed: () {
                                    controller
                                        .acceptRequestClient(providerService);
                                  },
                                  text: "Confirmar pedido")
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
