import 'package:car_fix/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PickerImage extends StatelessWidget {
  Rx<XFile?> file;
  RxString? filePath;
  RxString textBtn;
  RxString txtError;
  PickerImage({
    super.key,
    required this.file,
    required this.filePath,
    required this.textBtn,
    required this.txtError,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return InkWell(
          child: Container(
            decoration: BoxDecoration(
              color: ColorsProject.grayContrast,
              borderRadius: BorderRadius.circular(5),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.attachment,
                  color: ColorsProject.buttonPrimary,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        textBtn.value,
                        style: const TextStyle(
                          color: ColorsProject.gray3,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      txtError.value != "" ? Text(
                        txtError.value,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 196, 16, 3),
                        ),
                      )
                      : Container()
                    ],
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            final ImagePicker picker = ImagePicker();
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  width: double.infinity,
                  height: 200,
                  color: ColorsProject.grayContrast,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              file.value = await picker.pickImage(
                                  source: ImageSource.gallery);
                              if (file.value != null) {
                                filePath!.value = file.value!.path;
                                textBtn.value = "Imagem escolhida";
                                Navigator.pop(context);
                              }
                            },
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.insert_photo_outlined,
                                  size: 40,
                                  color: ColorsProject.buttonPrimary,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Escolher da galeria",
                                  style: TextStyle(
                                      color: ColorsProject.buttonPrimary,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              file.value = await picker.pickImage(
                                  source: ImageSource.camera);
                              if (file.value != null) {
                                filePath!.value = file.value!.path;
                                textBtn.value = "Imagem escolhida";
                                Navigator.pop(context);
                              }
                            },
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.camera_alt,
                                  size: 40,
                                  color: ColorsProject.buttonPrimary,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Tirar foto",
                                  style: TextStyle(
                                      color: ColorsProject.buttonPrimary,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
