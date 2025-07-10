import 'package:car_fix/pages/home_service_provider/home_service_provider_controller.dart';
import 'package:car_fix/utils/colors.dart';
import 'package:car_fix/utils/get_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeServiceProviderScreen extends GetView<HomeServiceProviderController> {
  const HomeServiceProviderScreen({super.key});

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
                    Center(
                      child:
                          Container(color: Colors.amber, width: 50, height: 50),
                    )
                  ],
                ),
        );
      },
    );
  }
}
