import 'package:car_fix/utils/colors.dart';
import 'package:flutter/material.dart';

class TextButtonCustom extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const TextButtonCustom({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero, 
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: ColorsProject.buttonPrimary,
          decorationColor: ColorsProject.buttonPrimary,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
