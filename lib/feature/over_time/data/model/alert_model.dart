import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';

class AlertModel {
  double? originalDuration;
  bool? isHandled;
  int? id;
  String? date;
  String? time;
  double? duration;
  String? timeTable;
  int? planDetailId;
  String? type;
  String? transactionType;
  String? alertType;
  String? status;
  String? notes;

  AlertModel({
    this.originalDuration,
    this.isHandled,
    this.id,
    this.date,
    this.time,
    this.duration,
    this.timeTable,
    this.planDetailId,
    this.type,
    this.transactionType,
    this.alertType,
    this.status,
    this.notes,
  });



  /// 🧩 من JSON
  AlertModel.fromJson(Map<String, dynamic> json) {
    originalDuration = json['OriginalDuration'];
    isHandled = json['IsHandled'];
    id = json['Id'];

    // نحول التاريخ هنا مباشرة لو كان هجري
    final rawDate = json['Date'];
    if (rawDate is String && rawDate.isNotEmpty) {
      date = convertHijriToGregorian(rawDate);
    } else {
      date = rawDate;
    }

    time = json['Time'];
    duration = json['Duration'];
    timeTable = json['TimeTable'];
    planDetailId = json['PlanDetailId'];
    type = json['Type'];
    transactionType = json['TransactionType'];
    alertType = json['AlertType'];
    status = json['Status'];
    notes = json['notes'];
  }

  /// 🔁 إلى JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['duration'] = duration;
    data['notes'] = notes;
    return data;
  }
}
/// ⏱️ تحويل التاريخ الهجري إلى ميلادي إن وجد
String convertHijriToGregorian(String date) {
  try {
    // دعم الشكلين 1447/04/20 و1447-04-20
    final cleaned = date.replaceAll('-', '/');
    final parts = cleaned.split('/');
    if (parts.length != 3) return date;

    final year = int.parse(parts[0]);
    final month = int.parse(parts[1]);
    final day = int.parse(parts[2]);

    // لو السنة أكبر من 1700 فهي ميلادية
    if (year >= 1700) return date;

    final hijri = HijriCalendar()
      ..hYear = year
      ..hMonth = month
      ..hDay = day;

    final gregorian = hijri.hijriToGregorian(year, month, day);

    final gregorianWithTime = DateTime(
      gregorian.year,
      gregorian.month,
      gregorian.day,
      0,
      0,
      0,
    );

    return DateFormat("dd-MM-yyyy'T'HH:mm:ss.SSS").format(gregorianWithTime);
  } catch (e) {
    print('❌ Error in _convertHijriToGregorian: $e');
    return date;
  }
}





//
// class AlertModel {
//   double? originalDuration;
//   bool? isHandled;
//   int? id;
//   String? date;
//   String? time;
//   double? duration;
//   String? timeTable;
//   int? planDetailId;
//   String? type;
//   String? transactionType;
//   String? alertType;
//   String? status;
//
//   String? notes;
//
//   AlertModel(
//       {this.originalDuration,
//         this.isHandled,
//         this.id,
//         this.date,
//         this.time,
//         this.duration,
//         this.timeTable,
//         this.planDetailId,
//         this.type,
//         this.transactionType,
//         this.alertType,
//         this.status,
//         this.notes
//
//       });
//
//   AlertModel.fromJson(Map<String, dynamic> json) {
//     originalDuration = json['OriginalDuration'];
//     isHandled = json['IsHandled'];
//     id = json['Id'];
//     date = json['Date'];
//     time = json['Time'];
//     duration = json['Duration'];
//     timeTable = json['TimeTable'];
//     planDetailId = json['PlanDetailId'];
//     type = json['Type'];
//     transactionType = json['TransactionType'];
//     alertType = json['AlertType'];
//     status = json['Status'];
//     notes = json['notes'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['date'] = date;
//     data['duration'] = duration;
//     data['notes'] = notes;
//     return data;
//   }
//
//
// }
