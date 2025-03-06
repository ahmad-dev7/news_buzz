import 'package:flutter/material.dart';
import 'package:news_buzz/components/custom_text.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final TextInputType inputType;
  final bool isPassword;
  const CustomTextField({
    super.key,
    required this.textController,
    required this.hintText,
    required this.inputType,
    required this.isPassword,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (val) {
        return null;
      },
      decoration: InputDecoration(
        hintText: "Enter email Id",
        label: CustomText("Email"),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
