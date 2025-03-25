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
      padding: const EdgeInsets.only(top: 35.0, left: 16),
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
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 16),
            child: TextField(
              style: const TextStyle(color: Colors.white, fontSize: 23),
              controller: widget.nicknameController,
              maxLength: 10,
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
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                filled: true,
                fillColor: const Color.fromARGB(206, 28, 27, 27),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                        color: _isValidNickname
                            ? const Color.fromARGB(220, 181, 217, 53)
                            : Colors.white)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
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
                    backgroundColor: _isValidNickname
                        ? const Color.fromARGB(255, 181, 217, 53)
                        : Colors.black,
                    minimumSize: const Size(250, 50)),
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
