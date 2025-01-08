import 'package:car_fix/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldCustom extends StatelessWidget {
  final IconData? icon;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? maskFormatter;
  
  const TextFormFieldCustom({
    super.key,
    required this.icon,
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
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        style: const TextStyle(
          color: ColorsProject.buttonPrimary,
        ),
        inputFormatters: maskFormatter,
        controller: controller,
        keyboardType: textInputType ?? TextInputType.text,
        decoration: InputDecoration(
          icon: Icon(icon, color: ColorsProject.buttonPrimary),
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
