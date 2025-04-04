// 🐦 Flutter imports:
import 'package:betting_app/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class NicknameStep extends StatefulWidget {
  const NicknameStep(
      {super.key,
      required this.nicknameController,
      required this.isEditingProfile,
      required this.onNext});

  final Function(String, bool) onNext;
  final TextEditingController nicknameController;
  final bool isEditingProfile;

  @override
  State<StatefulWidget> createState() => _NicknameStepState();
}

class _NicknameStepState extends State<NicknameStep> {
  String? _errorMessage;
  bool _isValidNickname = false;

  void _onSubmit() async {
    widget.onNext(widget.nicknameController.text, widget.isEditingProfile);
  }

  @override
  void initState() {
    setState(() {
      _isValidNickname =
          widget.nicknameController.text.length >= 5 ? true : false;
    });
    super.initState();
    widget.nicknameController.addListener(() {
      setState(() {
        _isValidNickname =
            widget.nicknameController.text.length >= 5 ? true : false;
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
          const Text('Scegli il tuo nickname',
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Playfair Display')),
          const SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
                gradient: AppColors.bgTextFieldReg,
                borderRadius: BorderRadius.circular(16)),
            child: TextField(
              autocorrect: false,
              style: const TextStyle(color: Colors.white, fontSize: 23),
              controller: widget.nicknameController,
              onChanged: (text) {
                String filteredText =
                    text.replaceAll(RegExp(r'[^a-zA-Z0-9 ]'), '');
                if (text != filteredText) {
                  widget.nicknameController.value = TextEditingValue(
                    text: filteredText,
                    selection:
                        TextSelection.collapsed(offset: filteredText.length),
                  );
                }
              },
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10.0),
                border: InputBorder.none,
                filled: false,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                        color: _isValidNickname
                            ? const Color.fromARGB(220, 181, 217, 53)
                            : const Color.fromARGB(255, 72, 71, 71))),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                      color: _isValidNickname
                          ? const Color.fromARGB(220, 181, 217, 53)
                          : const Color.fromARGB(255, 48, 45, 45),
                      width: 2),
                ),
                errorText: _errorMessage,
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
                onPressed: _isValidNickname
                    ? () {
                        _onSubmit();
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 181, 217, 53),
                    disabledBackgroundColor:
                        const Color.fromARGB(255, 72, 71, 71),
                    minimumSize: const Size(280, 55)),
                child: const Text(
                  "AVANTI",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
