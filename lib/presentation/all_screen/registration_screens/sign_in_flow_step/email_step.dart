// 🐦 Flutter imports:
// 🌎 Project imports:
import 'package:betting_app/core/theme/app_colors.dart';
import 'package:betting_app/logic/utils/regex.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmailStep extends StatefulWidget {
  const EmailStep(
      {super.key,
      required this.emailController,
      required this.isEditingProfile,
      required this.onNext});

  final Function(String, bool) onNext;
  final TextEditingController emailController;
  final bool isEditingProfile;

  @override
  State<StatefulWidget> createState() => _EmailStepState();
}

class _EmailStepState extends State<EmailStep> {
  bool _isValidEmail = false;

  void _onSubmit() {
    widget.onNext(widget.emailController.text, widget.isEditingProfile);
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _isValidEmail =
          Regex.instance.isValidEmailFormat(widget.emailController.text);
    });

    widget.emailController.addListener(() {
      setState(() {
        _isValidEmail =
            Regex.instance.isValidEmailFormat(widget.emailController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 16, right: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Inserisci la tua Email",
              style: TextStyle(
                  fontSize: 31,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Playfair Display')),
          const SizedBox(
            height: 40,
          ),
          Container(
            decoration: BoxDecoration(
                gradient: AppColors.bgTextFieldReg,
                borderRadius: BorderRadius.circular(16)),
            child: TextField(
              autocorrect: false,
              style: const TextStyle(color: Colors.white, fontSize: 23),
              controller: widget.emailController,
              inputFormatters: [
                LengthLimitingTextInputFormatter(30),
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@.]')),
              ],
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 12.0),
                filled: false,
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: _isValidEmail
                        ? const Color.fromARGB(220, 181, 217, 53)
                        : const Color.fromARGB(255, 88, 86, 86),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: _isValidEmail
                        ? const Color.fromARGB(220, 181, 217, 53)
                        : const Color.fromARGB(255, 48, 45, 45),
                    width: 2,
                  ),
                ),
                hintFadeDuration: const Duration(milliseconds: 30),
                hintStyle: const TextStyle(
                    fontWeight: FontWeight.w200, color: Colors.white),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 45),
            child: Center(
              child: ElevatedButton(
                onPressed: _isValidEmail
                    ? () {
                        _onSubmit();
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 181, 217, 53), // Verde quando attivo
                    disabledBackgroundColor:
                        const Color.fromARGB(255, 72, 71, 71),
                    minimumSize: const Size(280, 55)),
                child: const Text(
                  "AVANTI",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Playfair Display'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
