import 'package:car_fix/utils/colors.dart';
import 'package:flutter/material.dart';

class TextFormFieldCepCustom extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final validator;
  final FocusNode focusNode;
  final VoidCallback fetchCep;
  const TextFormFieldCepCustom({
    super.key,
    required this.hintText,
    required this.controller,
    required this.validator,
    required this.focusNode,
    required this.fetchCep,
  });

  @override
  State<TextFormFieldCepCustom> createState() => _TextFormFieldCepCustomState();
}

class _TextFormFieldCepCustomState extends State<TextFormFieldCepCustom> {
  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_onFocusChange);
    super.dispose();
  }

  void _onFocusChange() {
    if (!widget.focusNode.hasFocus) {
      widget.fetchCep();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsProject.grayContrast,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        keyboardType: TextInputType.number,
        style: const TextStyle(
          color: ColorsProject.buttonPrimary,
        ),
        controller: widget.controller,
        focusNode: widget.focusNode,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: ColorsProject.gray3,
          ),
          border: InputBorder.none,
        ),
        validator: widget.validator,
      ),
    );
  }
}
