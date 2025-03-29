// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<StatefulWidget> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<ForgotPassword> {
  final _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Forgot Password?'),
      ),
      body: Center(
        child: TextField(
          controller: _emailTextController,
          decoration: const InputDecoration(
            label: Text('Email'),
          ),
        ),
      ),
    );
  }
}
