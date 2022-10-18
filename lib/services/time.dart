import 'package:intl/intl.dart';

extension DateCustomFormat on DateTime {
  String toNamedDate() {
    return DateFormat('MMMM dd, yyyy').format(this);
  }
}
