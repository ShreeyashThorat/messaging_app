import 'package:intl/intl.dart';

class Formatter {
  static String formatDate(String date) {
    String originalDateString = date;
    DateTime originalDate = DateTime.parse(originalDateString).toLocal();
    final dateFormat = DateFormat('h:mm');
    return dateFormat.format(originalDate);
  }
}
