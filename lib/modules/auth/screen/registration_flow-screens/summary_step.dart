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
                onPressed: () {},
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
