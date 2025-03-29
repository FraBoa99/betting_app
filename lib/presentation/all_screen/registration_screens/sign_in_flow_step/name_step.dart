// 🐦 Flutter imports:
import 'package:betting_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NameStep extends StatefulWidget {
  const NameStep(
      {super.key,
      required this.nameController,
      required this.surnameController,
      required this.onNext});

  final Function(String, String) onNext;
  final TextEditingController nameController;
  final TextEditingController surnameController;

  @override
  State<StatefulWidget> createState() => _NameStepState();
}

class _NameStepState extends State<NameStep> {
  bool _isFormValid = false;
  bool _isNameValid = false;
  bool _isSurnameValid = false;
  String? _errorMessage;

  void _onSubmit() {
    widget.onNext(widget.nameController.text, widget.surnameController.text);
  }

  @override
  void initState() {
    super.initState();

    _isNameValid = (widget.nameController.text.length > 3);
    _isSurnameValid = (widget.surnameController.text.length > 3);
    _isFormValid = (_isNameValid && _isSurnameValid);

    setState(() {
      _isFormValid;
      _isNameValid;
      _isSurnameValid;
    });

    widget.nameController.addListener(() {
      String newText =
          widget.nameController.text.replaceAll(RegExp(r'\s+'), ' ');
      if (widget.nameController.text != newText) {
        widget.nameController.value = TextEditingValue(
          text: newText,
          selection: TextSelection.collapsed(offset: newText.length),
        );
      }
      _isNameValid = (widget.nameController.text.length > 3);

      setState(() {
        _isNameValid;
        _isFormValid = (_isNameValid && _isSurnameValid);
      });
    });
    widget.surnameController.addListener(() {
      String newText =
          widget.surnameController.text.replaceAll(RegExp(r'\s+'), ' ');
      if (widget.surnameController.text != newText) {
        widget.surnameController.value = TextEditingValue(
          text: newText,
          selection: TextSelection.collapsed(offset: newText.length),
        );
      }
      _isSurnameValid = (widget.surnameController.text.length > 3);

      setState(() {
        _isSurnameValid;
        _isFormValid = (_isNameValid && _isSurnameValid);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 16, right: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Creazione Account',
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontFamily: 'Playfair Display',
              )),
          const SizedBox(
            height: 40,
          ),
          const Text('Nome',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: 'Playfair Display',
              )),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                gradient: AppColors.bgTextFieldReg,
                borderRadius: BorderRadius.circular(16)),
            child: TextField(
                autocorrect: false,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(30),
                ],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                ),
                controller: widget.nameController,
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
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 10.0),
                  filled: false,
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                        color: _isNameValid
                            ? const Color.fromARGB(220, 181, 217, 53)
                            : const Color.fromARGB(255, 72, 71, 71)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: _isNameValid
                          ? const Color.fromARGB(220, 181, 217, 53)
                          : const Color.fromARGB(255, 48, 45, 45),
                      width: 2,
                    ),
                  ),
                  errorText: _errorMessage,
                  hintFadeDuration: const Duration(milliseconds: 30),
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.w200, color: Colors.white),
                )),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text('Cognome',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: 'Playfair Display',
              )),
          const SizedBox(
            height: 10,
          ),
          Container(
              decoration: BoxDecoration(
                  gradient: AppColors.bgTextFieldReg,
                  borderRadius: BorderRadius.circular(16)),
              child: TextField(
                  autocorrect: false,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(30),
                  ],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                  ),
                  controller: widget.surnameController,
                  onChanged: (text) {
                    String filteredText =
                        text.replaceAll(RegExp(r'[^a-zA-Z ]'), '');

                    if (text != filteredText) {
                      widget.surnameController.value = TextEditingValue(
                        text: filteredText,
                        selection: TextSelection.collapsed(
                            offset: filteredText.length),
                      );
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 10.0),
                    filled: false,
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                            color: _isSurnameValid
                                ? const Color.fromARGB(220, 181, 217, 53)
                                : const Color.fromARGB(255, 72, 71, 71))),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color: _isSurnameValid
                              ? const Color.fromARGB(220, 181, 217, 53)
                              : const Color.fromARGB(255, 48, 45, 45),
                          width: 2),
                    ),
                    errorText: _errorMessage,
                    hintFadeDuration: const Duration(milliseconds: 30),
                    hintStyle: const TextStyle(
                        fontWeight: FontWeight.w200, color: Colors.white),
                  ))),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 45),
            child: Center(
              child: ElevatedButton(
                onPressed: _isFormValid
                    ? () {
                        _onSubmit();
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 181, 217, 53),
                    disabledBackgroundColor:
                        const Color.fromARGB(255, 72, 71, 71),
                    minimumSize: const Size(280, 55)),
                child: const Text("AVANTI",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Playfair Display')),
              ),
            ),
          )
        ],
      ),
    );
  }
}
