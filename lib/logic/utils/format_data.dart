import 'package:intl/intl.dart';

String formatDateTime(String isoString) {
  final dateTime = DateTime.parse(isoString).toLocal();
  final formatter = DateFormat('EEE dd, HH:mm');
  return formatter.format(dateTime);
}
