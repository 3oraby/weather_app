import 'package:intl/intl.dart';

String formatTimeStringWithAMPM(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString);
  String formattedTime = DateFormat('h:mm a').format(dateTime);
  return formattedTime;
}

String getDayName(String dateString) {
  DateTime date = DateTime.parse(dateString);
  return DateFormat('EEEE').format(date);
}
