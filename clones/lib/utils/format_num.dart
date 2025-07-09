import 'package:intl/intl.dart';

String formatNumberWithSeparator(double? num) {
  if (num == null) return '0.00';
  final formatter = NumberFormat('#,##0.00', 'en_US');
  return formatter.format(num);
}
