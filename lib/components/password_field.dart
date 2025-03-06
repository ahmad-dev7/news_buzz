import 'package:flutter/material.dart';
import 'package:news_buzz/components/custom_text.dart';
import 'package:news_buzz/constants/k_validators.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController textController;
  const PasswordField({super.key, required this.textController});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textController,
      validator: kPasswordValidator,
      obscureText: _isObscure,
      decoration: InputDecoration(
        hintText: 'Enter password',
        label: CustomText('Password'),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        suffix: IconButton(
          onPressed: () => setState(() => _isObscure = !_isObscure),
          icon: Icon(
            _isObscure ? Icons.visibility : Icons.visibility_off_outlined,
          ),
        ),
      ),
    );
  }
}
