import 'package:betting_app/logic/utils/verification_helper.dart';
import 'package:flutter/material.dart';

class NameStep extends StatefulWidget {
  const NameStep(
      {super.key,
      required this.nameController,
      required this.isEditingProfile,
      required this.onNext});

  final Function(String, bool) onNext;
  final TextEditingController nameController;
  final bool isEditingProfile;

  @override
  State<StatefulWidget> createState() => _NameStepState();
}

class _NameStepState extends State<NameStep> {
  bool _isValidName = false;
  String? _errorMessage;

  void _onSubmit() {
    widget.onNext(widget.nameController.text, widget.isEditingProfile);
  }

  @override
  void initState() {
    //Eseguo doppio controllo. Prima, e in caso di modifica della textfield.
    super.initState();

    _isValidName =
        VerificationHelper.instance.isValidName(widget.nameController.text);

    setState(() {
      _isValidName;
    });

    widget.nameController.addListener(() {
      String newText = widget.nameController.text.replaceAll(
          RegExp(r'\s+'), ' '); // Sostituisce più spazi con uno solo
      if (widget.nameController.text != newText) {
        widget.nameController.value = TextEditingValue(
          text: newText,
          selection: TextSelection.collapsed(
              offset: newText.length), // Mantiene il cursore alla fine
        );
      }
      _isValidName =
          VerificationHelper.instance.isValidName(widget.nameController.text);

      _isValidName
          ? setState(() {
              _isValidName;
            })
          : null;
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
          const Text('Ciao!\nCome ti chiami?',
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
                controller: widget.nameController,
                maxLength: 22,
                onChanged: (text) {
                  String filteredText =
                      text.replaceAll(RegExp(r'[^a-zA-Z ]'), '');

                  if (text != filteredText) {
                    widget.nameController.value = TextEditingValue(
                      text: filteredText,
                      selection:
                          TextSelection.collapsed(offset: filteredText.length),
                    );
                  }
                },
                decoration: InputDecoration(
                    hintText: "Mario Rossi",
                    errorText: _errorMessage,
                    hintFadeDuration: const Duration(milliseconds: 30),
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w200,
                    ))),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 45),
            child: Center(
              child: ElevatedButton(
                onPressed: _isValidName
                    ? () {
                        _onSubmit();
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                        _isValidName ? Colors.blue : Colors.grey.shade300,
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
