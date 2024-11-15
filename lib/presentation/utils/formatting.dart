import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class Formatting {
  static displayDate(DateTime date) =>
      DateFormat('EEE, d MMM yyyy').format(date);

  static screenHeight(BuildContext context) =>
      MediaQuery.sizeOf(context).height;
}