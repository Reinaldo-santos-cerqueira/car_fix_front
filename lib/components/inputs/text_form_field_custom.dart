import 'package:car_fix/utils/colors.dart';
import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final TextEditingController controller;

  const TextFormFieldCustom({
    super.key,
    required this.icon,
    required this.hintText,
    required this.controller,
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
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(icon, color: ColorsProject.buttonPrimary),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: ColorsProject.gray3,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
