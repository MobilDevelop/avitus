import 'package:avitus/application/add_store/add_store_index.dart';

class HelperMedhod {
  static String formatDate(DateTime dateTime) {
    final String date = DateFormat('dd.MM.yyyy').format(dateTime);

    return date;
  }

  static String formatTime() {
    DateTime dateTime = DateTime.now();
    final String time = DateFormat('HH:mm:ss').format(dateTime);

    return time;
  }

  static int dateCalculate(String date) {
    final DateFormat displayFormater = DateFormat('dd.MM.yyyy');
    final DateTime displayDate = displayFormater.parse(date);
    final date2 = DateTime.now();
    int difference = displayDate.difference(date2).inDays;

    return difference;
  }

  static String chooseType(int index) {
    switch (index) {
      case 1:
        return tr('store.naqd');
      case 2:
        return tr('store.karta');
      case 3:
        return tr('store.bank');

      default:
        return '';
    }
  }

  static String toProcessCost(String value) {
    if (value == '0') {
      return '0';
    }

    String valueRealPart = '';
    String number = "";
    if (value.indexOf('.') > 0) {
      valueRealPart = value.substring(value.indexOf('.'), value.length);
      value = value.substring(0, value.indexOf('.'));
    }
    String count = '';
    if (value.length > 3) {
      int a = 0;
      for (int i = value.length; 0 < i; i--) {
        if (a % 3 == 0) {
          count = value.substring(i - 1, i) + ' ' + count;
        } else {
          count = value.substring(i - 1, i) + count;
        }
        a++;
      }
    } else {
      count = value;
    }

    return count;
  }
}
