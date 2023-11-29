import 'package:intl/intl.dart';

extension DateStringExtensions on DateTime {
  String formattedDate() {
    return DateFormat('dd.MM.yyyy').format(this);
  }

  String formattedTime() {
    return DateFormat('HH:mm').format(this);
  }
}
