import 'package:betting_app/data/models/local_user.dart';
import 'package:flutter/material.dart';

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
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 16),
      child: Column(
        children: [
          const Text(
            'Riepilogo Account:\nControlla i Tuoi Dati 🔍',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 20,
          ),
          _buildListItem("Nome", widget.name, widget.onEditName),
          _buildListItem("Data di nascita", widget.birthday.toString(),
              widget.onEditBirthday),
          _buildListItem("Email", widget.email, widget.onEditEmail),
          _buildListItem("Nickname", widget.nickname, widget.onEditNickname),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 45),
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size(250, 50)),
                onPressed: () {
                  widget.onSubmit();
                },
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

Widget _buildListItem(String title, String value, VoidCallback onTap) {
  return ListTile(
    title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
    subtitle: Text(value),
    trailing: const Icon(Icons.edit),
    onTap: onTap,
  );
}
