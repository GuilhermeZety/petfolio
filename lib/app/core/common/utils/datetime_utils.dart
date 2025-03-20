import 'package:intl/intl.dart';

class DateTimeUtils {
  // Vai chegar 2024-04-30 ---> 30/04/2024
  static String treatDate(String date, {bool reverse = false}) {
    if (reverse) {
      return date.split('/').reversed.join('-');
    } else {
      return date.split('-').reversed.join('/');
    }
  }

  // Hour --> DateTime
  // Hour == hh:mm
  static DateTime? getDateFromHour(String hour) {
    if (hour.isEmpty) return null;
    if (hour.length < 5) {
      return null;
    }
    var splitted = hour.split(':');
    return DateTime(0, 0, 0, int.parse(splitted[0]), int.parse(splitted[1]));
  }

  static DateTime? treatUTC(DateTime? date) {
    if (date == null) return null;
    return DateTime.utc(date.year, date.month, date.day, date.hour, date.minute);
  }

  static DateTime dateFromMinutes(int minutes) {
    return DateTime(0, 0, 0, 0, minutes);
  }

  static String formatDMA(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static String formatDMAForText(String date) {
    return DateFormat('dd/MM/yyyy').format(dateFromDMA(date));
  }

  // dd/MM/yyyy to DateTime
  static DateTime dateFromDMA(String date) {
    return DateFormat('dd/MM/yyyy').parse(date);
  }
}

extension DateUtils on DateTime? {
  String? toDMA() {
    if (this == null) return null;
    return DateFormat('dd/MM/yyyy').format(this!);
  }

  String? toAMD() {
    if (this == null) return null;
    return DateFormat('yyyy-MM-dd').format(this!);
  }
}
