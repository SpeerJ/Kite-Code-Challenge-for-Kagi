import 'package:intl/intl.dart';

class Formatting {
  static displayDate(DateTime date) =>
      DateFormat('EEE, d MMM yyyy').format(date);
}