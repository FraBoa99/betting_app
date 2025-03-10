import 'package:betting_app/utils/verification_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BirthdateStep extends StatefulWidget {
  const BirthdateStep(
      {super.key,
      required this.dateController,
      required this.isEditingProfile,
      required this.onNext});

  final Function(DateTime, bool) onNext;
  final TextEditingController dateController;
  final bool isEditingProfile;

  @override
  State<StatefulWidget> createState() => _BirthdateStepState();
}

class _BirthdateStepState extends State<BirthdateStep> {
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    widget.dateController.addListener(() {
      _formatDateInput();
      _validateDate();
    });
  }

  void _formatDateInput() {
    String text = widget.dateController.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (text.length > 8) {
      text = text.substring(0, 8);
    }

    String formattedText = '';
    for (int i = 0; i < text.length; i++) {
      if (i == 2 || i == 4) {
        formattedText += '/';
      }
      formattedText += text[i];
    }

    if (formattedText != widget.dateController.text) {
      widget.dateController.value = TextEditingValue(
        text: formattedText,
        selection: TextSelection.collapsed(offset: formattedText.length),
      );
    }
  }

  void _validateDate() {
    String date = widget.dateController.text;
    bool isValid = _parseData(date) != null;

    setState(() {
      _errorMessage = isValid ? null : "Inserisci una data valida (DD/MM/YYYY)";
    });
  }

  DateTime? _parseData(String date) {
    if (date.length != 10) return null;
    try {
      List<String> parts = date.split('/');
      int day = int.parse(parts[0]);
      int month = int.parse(parts[1]);
      int year = int.parse(parts[2]);

      DateTime parsedDate = DateTime(year, month, day);
      if (parsedDate.day != day) return null;

      return parsedDate;
    } catch (e) {
      return null;
    }
  }

  void _onSubmit() {
    DateTime? date = _parseData(widget.dateController.text);

    if (date != null) {
      if (!VerificationHelper.instance.isAdult(date)) {
        setState(() {
          _errorMessage = 'Per registrarsi bisogna essere maggiorenni';
        });
      }
      if (VerificationHelper.instance.isOver100(date)) {
        setState(() {
          _errorMessage = 'Inserisci la tua vera data di nascita';
        });
      }
    }

    if (_errorMessage == null && date != null) {
      widget.onNext(date, widget.isEditingProfile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35.0, left: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Inserisci la tua data di nascita",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Roboto')),
          const SizedBox(
            height: 50,
          ),
          TextField(
            controller: widget.dateController,
            keyboardType: TextInputType.number,
            maxLength: 10,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              hintText: "DD/MM/YYYY",
              border: InputBorder.none,
              errorText: _errorMessage,
              counterText: "", // Nasconde il contatore di caratteri
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly, // Solo numeri
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 45),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  _onSubmit();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: widget.dateController.text.length == 10
                        ? Colors.blue
                        : Colors.grey.shade300,
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
