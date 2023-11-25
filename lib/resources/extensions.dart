import 'package:intl/intl.dart';

extension DateStringExtensions on DateTime {
  DateTime parse() {
    return DateTime.parse(toString());
  }

  String parseDayMonthYear() {
    return DateFormat('dd.MM.yyyy').format(this);
  }

  String parseTime() {
    return DateFormat('HH:mm').format(this);
  }
}
