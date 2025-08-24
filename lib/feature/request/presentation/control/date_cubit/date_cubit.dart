import 'package:flutter_bloc/flutter_bloc.dart';
import 'date_state.dart';
import 'package:flutter/material.dart';

// class DateCubit extends Cubit<DateState> {
//   DateCubit() :super(DateState(dateTime: DateTime.now()));
//
//
//   void updateDate(DateTime date) {
//     emit(state.copyWith(dateTime: date));
//   }
//   setFromDate(DateTime date) {
//     emit(state.copyWith(fromDate: date));
//   }
//   setToDate(DateTime date) {
//     emit(state.copyWith(toDate: date));
//   }
//
//   void setFromTime(TimeOfDay time) {
//     emit(state.copyWith(fromTime: time));
//   }
//
//   void setToTime(TimeOfDay time) {
//     emit(state.copyWith(toTime: time));
//   }
//
//   Duration? getDuration() {
//     if (state.fromDate == null ||
//         state.toDate == null ||
//         state.fromTime == null ||
//         state.toTime == null) {
//       return null;
//     }
//
//     final fromDateTime = DateTime(
//       state.fromDate!.year,
//       state.fromDate!.month,
//       state.fromDate!.day,
//       state.fromTime!.hour,
//       state.fromTime!.minute,
//     );
//
//     final toDateTime = DateTime(
//       state.toDate!.year,
//       state.toDate!.month,
//       state.toDate!.day,
//       state.toTime!.hour,
//       state.toTime!.minute,
//     );
//
//     if (toDateTime.isBefore(fromDateTime)) return null;
//
//     return toDateTime.difference(fromDateTime);
//   }
//
//   String getDurationText() {
//     final duration = getDuration();
//     if (duration == null) return "المدة غير محددة";
//
//     final days = duration.inDays;
//     final hours = duration.inHours.remainder(24);
//     final minutes = duration.inMinutes.remainder(60);
//
//     List<String> parts = [];
//
//     if (days > 0) {
//       parts.add("$days يوم${days > 1 ? '' : ''}");
//     }
//     if (hours > 0) {
//       parts.add("$hours ساعة");
//     }
//     if (minutes > 0) {
//       parts.add("$minutes دقيقة");
//     }
//
//     if (parts.isEmpty) {
//       return "0 دقيقة";
//     }
//
//     return parts.join(" و ");
//   }
//   void updateDateTime({
//     DateTime? fromDate,
//     DateTime? toDate,
//     TimeOfDay? fromTime,
//     TimeOfDay? toTime,
//   }) {
//     final newState = state.copyWith(
//       fromDate: fromDate ?? state.fromDate,
//       toDate: toDate ?? state.toDate,
//       fromTime: fromTime ?? state.fromTime,
//       toTime: toTime ?? state.toTime,
//     );
//
//     emit(newState.copyWith(
//       duration: _calculateDuration(
//         newState.fromDate,
//         newState.toDate,
//         newState.fromTime,
//         newState.toTime,
//       ),
//     ));
//   }
//
//
//
// }
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'date_state.dart';
// import 'package:flutter/material.dart';

class DateCubit extends Cubit<DateState> {
  DateCubit() : super(DateState(dateTime: DateTime.now()));

  void updateDate(DateTime date) {
    emit(state.copyWith(dateTime: date));
  }

  void setFromDate(DateTime date) {
    emit(state.copyWith(
      fromDate: date,
      duration: _calculateDuration(
        date,
        state.toDate,
        state.fromTime,
        state.toTime,
      ),
    ));
  }

  void setToDate(DateTime date) {
    emit(state.copyWith(
      toDate: date,
      duration: _calculateDuration(
        state.fromDate,
        date,
        state.fromTime,
        state.toTime,
      ),
    ));
  }

  void setFromTime(TimeOfDay time) {
    emit(state.copyWith(
      fromTime: time,
      duration: _calculateDuration(
        state.fromDate,
        state.toDate,
        time,
        state.toTime,
      ),
    ));
  }

  void setToTime(TimeOfDay time) {
    emit(state.copyWith(
      toTime: time,
      duration: _calculateDuration(
        state.fromDate,
        state.toDate,
        state.fromTime,
        time,
      ),
    ));
  }

  Duration? _calculateDuration(
      DateTime? fromDate,
      DateTime? toDate,
      TimeOfDay? fromTime,
      TimeOfDay? toTime,
      ) {
    if (fromDate == null || toDate == null || fromTime == null || toTime == null) {
      return null;
    }

    final fromDateTime = DateTime(
      fromDate.year,
      fromDate.month,
      fromDate.day,
      fromTime.hour,
      fromTime.minute,
    );

    final toDateTime = DateTime(
      toDate.year,
      toDate.month,
      toDate.day,
      toTime.hour,
      toTime.minute,
    );

    if (toDateTime.isBefore(fromDateTime)) return null;

    return toDateTime.difference(fromDateTime);
  }

  String getDurationText() {
    final duration = state.duration;
    if (duration == null) return "المدة غير محددة";

    final days = duration.inDays;
    final hours = duration.inHours.remainder(24);
    final minutes = duration.inMinutes.remainder(60);

    List<String> parts = [];

    if (days > 0) parts.add("$days يوم");
    if (hours > 0) parts.add("$hours ساعة");
    if (minutes > 0) parts.add("$minutes دقيقة");

    if (parts.isEmpty) {
      return "0 دقيقة";
    }

    return parts.join(" و ");
  }
}
