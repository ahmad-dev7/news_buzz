import 'package:flutter/material.dart';
import 'package:news_buzz/components/custom_text.dart';
import 'package:news_buzz/components/email_field.dart';
import 'package:news_buzz/components/password_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        // horizontal padding of 20px
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          // Align vertically center
          mainAxisAlignment: MainAxisAlignment.center,
          // Align horizontally center
          crossAxisAlignment: CrossAxisAlignment.center,
          // Spacing between children
          spacing: 20,
          children: [
            CustomText(
              'Login to access NewsFeed',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            Form(
              key: _formKey,
              child: Column(
                spacing: 20,
                children: [
                  EmailField(textController: _emailController),
                  PasswordField(textController: _passwordController),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: FilledButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Here credentials can be sent to server for authentication
                    debugPrint(_emailController.text);
                    debugPrint(_passwordController.text);
                  }
                },
                child: CustomText("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
