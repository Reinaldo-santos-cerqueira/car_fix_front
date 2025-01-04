import 'package:car_fix/utils/colors.dart';
import 'package:flutter/material.dart';

class OutlinedButtonCustom extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const OutlinedButtonCustom({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: const BorderSide(
              color: ColorsProject.buttonPrimary,
              width: 2,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            text.toUpperCase(),
            style: const TextStyle(
              color: ColorsProject.buttonPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
        ),
      ),
    );
  }
}
