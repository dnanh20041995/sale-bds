import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  const CustomButton(
      {Key? key, required this.text, required this.onTap, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50), primary: color),
      child: Text(
        text,
        style: TextStyle(color: color == null ? Colors.white : Colors.black),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final TextInputType inputType;
  final Color color;
  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.inputType = TextInputType.text,
      this.maxLines = 1,
      this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(borderSide: BorderSide(color: color)),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: color))),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Nhập $hintText của bạn';
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
}
