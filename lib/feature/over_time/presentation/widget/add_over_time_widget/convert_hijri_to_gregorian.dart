import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';

String convertHijriToGregorian(String hijriDateString) {
  final parts = hijriDateString.split('/');
  final hYear = int.parse(parts[0]);
  final hMonth = int.parse(parts[1]);
  final hDay = int.parse(parts[2]);

  final hijriDate = HijriCalendar()
    ..hYear = hYear
    ..hMonth = hMonth
    ..hDay = hDay;

  final gregorian = hijriDate.hijriToGregorian(
    hijriDate.hYear,
    hijriDate.hMonth,
    hijriDate.hDay,
  ); // يتحول لميلادي

  return DateFormat('dd-MM-yyyy').format(gregorian);
}
