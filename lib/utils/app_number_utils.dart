import 'package:intl/intl.dart';

class AppNumberUtils {
  AppNumberUtils._();

  static String formatDoubleTwo(dynamic value) {
    if (value == null) return '0.00';

    final number = value is num ? value.toDouble() : double.tryParse(value.toString()) ?? 0.0;

    final formatter = NumberFormat('#,##0.00', 'en_US');
    return formatter.format(number);
  }
}
