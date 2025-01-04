import 'package:car_fix/utils/colors.dart';
import 'package:flutter/material.dart';

class TextFormFieldPasswordCustom extends StatefulWidget {
  final IconData icon;
  final String hintText;
  final TextEditingController controller;
  final validator;
  
  const TextFormFieldPasswordCustom({
    super.key,
    required this.icon,
    required this.hintText,
    required this.controller,
    required this.validator,
  });

  @override
  _TextFormFieldPasswordCustomState createState() =>
      _TextFormFieldPasswordCustomState();
}

class _TextFormFieldPasswordCustomState
    extends State<TextFormFieldPasswordCustom> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsProject.grayContrast,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(
          color: ColorsProject.buttonPrimary,
        ),
        controller: widget.controller,
        obscureText: _obscureText,
        decoration: InputDecoration(
          icon: Icon(widget.icon, color: ColorsProject.buttonPrimary),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: ColorsProject.gray3,
          ),
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: ColorsProject.buttonPrimary,
            ),
            onPressed: _togglePasswordVisibility,
          ),
        ),
        validator: widget.validator,
      ),
    );
  }
}
