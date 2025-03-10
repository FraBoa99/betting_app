import 'package:flutter/material.dart';

class PasswordStep extends StatefulWidget {
  const PasswordStep(
      {super.key,
      required this.passwordController,
      required this.isEditingProfile,
      required this.onNext});
  final Function(String, bool) onNext;
  final TextEditingController passwordController;
  final bool isEditingProfile;

  @override
  State<StatefulWidget> createState() => _PasswordStepState();
}

class _PasswordStepState extends State<PasswordStep> {
  String? _errorMessage;
  bool _isValidPassword = false;

  void _onSubmit() {
    widget.onNext(widget.passwordController.text, widget.isEditingProfile);
  }

  bool _checkPassword(String password) {
    bool hasNumber = RegExp(r'\d').hasMatch(password);

    if (hasNumber && password.length >= 6) {
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();

    widget.passwordController.addListener(() {
      if (_checkPassword(widget.passwordController.text)) {
        setState(() {
          _isValidPassword = true;
          _errorMessage = null;
        });
      } else {
        setState(() {
          _isValidPassword = false;
          _errorMessage =
              'La password deve essere di almeno 6 caratteri\nLa password deve avere almeno un numero';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Crea nuova password',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Roboto')),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 16),
            child: TextField(
              controller: widget.passwordController,
              onChanged: (text) {
                String filteredText =
                    text.replaceAll(RegExp(r'[^a-zA-Z0-9 ]'), '');

                if (text != filteredText) {
                  widget.passwordController.value = TextEditingValue(
                    text: filteredText,
                    selection:
                        TextSelection.collapsed(offset: filteredText.length),
                  );
                }
              },
              decoration: InputDecoration(
                  hintText: "",
                  errorText: _errorMessage,
                  hintFadeDuration: const Duration(milliseconds: 30)),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 45),
            child: Center(
              child: ElevatedButton(
                onPressed: _isValidPassword
                    ? () {
                        _onSubmit();
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                        _isValidPassword ? Colors.blue : Colors.grey.shade300,
                    minimumSize: const Size(250, 50)),
                child: const Text(
                  "AVANTI",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
