import 'package:avitus/application/add_store/add_store_index.dart';

class HelperMedhod {
  static String formatDate() {
    DateTime dateTime = DateTime.now();
    final String date = DateFormat('dd.MM.yyyy').format(dateTime);

    return date;
  }

  static String formatTime() {
    DateTime dateTime = DateTime.now();
    final String time = DateFormat('HH:mm:ss').format(dateTime);

    return time;
  }
}
