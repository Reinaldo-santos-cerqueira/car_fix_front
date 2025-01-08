import 'package:car_fix/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef DialogOptionBuilder<T> = Map<String, T?> Function();

Future<T?> showDialogError<T>({
  required BuildContext context,
  required String title,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Image(
                image: AssetImage("assets/images/atencao.png"),
                width: 50,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: const TextStyle(color: ColorsProject.gray3,fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () => Get.back(),
                child: const Text(
                  'OK',
                  style: TextStyle(color: ColorsProject.gray4, fontSize: 18),
                ),
              )
            ],
          ),
        ),
        backgroundColor: ColorsProject.grayContrast,
      );
    },
  );
}

Future<T?> showDialogSuccess<T>({
  required BuildContext context,
  required String title,
  required void Function()? onPressed,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Image(
                image: AssetImage("assets/images/sucesso.png"),
                width: 50,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: const TextStyle(color: ColorsProject.gray3,fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: onPressed,
                child: const Text(
                  'OK',
                  style: TextStyle(color: ColorsProject.gray4, fontSize: 18),
                ),
              )
            ],
          ),
        ),
        backgroundColor: ColorsProject.grayContrast,
      );
    },
  );
}
