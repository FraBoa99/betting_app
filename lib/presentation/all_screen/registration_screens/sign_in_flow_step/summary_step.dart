// 🐦 Flutter imports:
// 🌎 Project imports:
import 'package:betting_app/data/models/local_user.dart';
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:intl/intl.dart';

class SummaryStep extends StatefulWidget {
  String name;
  String email;
  String nickname;
  DateTime? birthday;
  String password;
  final VoidCallback onEditName;
  final VoidCallback onEditEmail;
  final VoidCallback onEditBirthday;
  final VoidCallback onEditNickname;

  final Future<LocalUser?> Function() onSubmit;

  SummaryStep({
    super.key,
    required this.name,
    required this.email,
    required this.birthday,
    required this.nickname,
    required this.password,
    required this.onEditName,
    required this.onEditEmail,
    required this.onEditBirthday,
    required this.onEditNickname,
    required this.onSubmit,
  });

  @override
  State<StatefulWidget> createState() => _SummaryStepState();
}

class _SummaryStepState extends State<SummaryStep> {
  @override
  Widget build(BuildContext context) {
    String birthday = DateFormat('yyyy-MM-dd').format(widget.birthday!);
    return Padding(
      padding: const EdgeInsets.only(top: 28.0, left: 16),
      child: Column(
        children: [
          const Text(
            'Riepilogo Account:\nControlla i Tuoi Dati 🔍',
            style: TextStyle(
                fontSize: 26, fontWeight: FontWeight.w600, color: Colors.white),
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 30,
          ),
          _buildListItem("Nome", widget.name, widget.onEditName),
          _buildListItem("Data di nascita", birthday, widget.onEditBirthday),
          _buildListItem("Email", widget.email, widget.onEditEmail),
          _buildListItem("Nickname", widget.nickname, widget.onEditNickname),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 45),
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 181, 217, 53),
                    minimumSize: const Size(280, 55)),
                onPressed: () {
                  widget.onSubmit();
                },
                child: const Text(
                  "AVANTI",
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildListItem(String title, String value, VoidCallback onTap) {
  return ListTile(
    title: Text(title,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 23, color: Colors.white)),
    subtitle: Text(value,
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color.fromARGB(255, 181, 178, 178))),
    trailing: const Icon(Icons.edit),
    onTap: onTap,
  );
}
