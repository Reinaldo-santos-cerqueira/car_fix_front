import 'package:car_fix/components/buttons/primary_button.dart';
import 'package:car_fix/pages/home_client/home_client_controller.dart';
import 'package:car_fix/utils/get_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../utils/colors.dart';

class HomeClientScreen extends GetView<HomeClientController> {
  const HomeClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var getSize = GetSize();
    return Obx(
      () {
        return Container();
      },
    );
  }
}
