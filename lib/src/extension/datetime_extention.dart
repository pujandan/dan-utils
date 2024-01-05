import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime? {
  /// extention set default value [nullable]
  /// return if null replace to [value]
  DateTime nullable(DateTime value) => this ?? value;

  /// extention format value to [string]
  /// return [string] dateTime with formating
  String formatString({String format = "dd MM yyy"}) {
    return DateFormat(format)
        .format(nullable(DateTime.now()).toLocal())
        .toString();
  }

  /// extention compare to [boolean]
  /// return [datetime] is [today]
  bool get isToday =>
      this?.year == DateTime.now().year &&
      this?.month == DateTime.now().month &&
      this?.day == DateTime.now().day;
}

// tambahkan compare operation
