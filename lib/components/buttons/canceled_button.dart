import 'package:car_fix/utils/colors.dart';
import 'package:flutter/material.dart';

class CanceledButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool loading;
  const CanceledButton(
      {super.key, required this.onPressed, required this.text, loading = false})
      : loading = loading ? loading : false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: loading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsProject.redPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            loading ? "Carregando..." : text.toUpperCase(),
            style: const TextStyle(
              color: ColorsProject.white,
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
