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
      padding: const EdgeInsets.only(top: 30.0, left: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Inserisci la tua Email",
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
              controller: widget.emailController,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(
                    r'[a-zA-Z0-9@.]')), //Solo lettere,numeri,@ e punto. ;)
              ],
              decoration: const InputDecoration(
                  hintText: "esempio@gmail.com",
                  hintFadeDuration: Duration(milliseconds: 30),
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w200,
                  )),
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
                    backgroundColor:
                        _isValidEmail ? Colors.blue : Colors.grey.shade300,
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
