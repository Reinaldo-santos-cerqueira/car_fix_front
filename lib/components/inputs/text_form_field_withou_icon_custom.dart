import 'package:car_fix/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormWithoutIconFieldCustom extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final validator;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? maskFormatter;

  const TextFormWithoutIconFieldCustom({
    super.key,
    required this.hintText,
    required this.controller,
    required this.validator,
    this.textInputType,
    this.maskFormatter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsProject.grayContrast,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        keyboardType: textInputType ?? TextInputType.text,
        style: const TextStyle(
          color: ColorsProject.buttonPrimary,
        ),
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: ColorsProject.gray3,
          ),
          border: InputBorder.none,
        ),
        validator: validator,
      ),
    );
  }
}
