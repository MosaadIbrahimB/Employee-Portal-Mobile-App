import 'package:flutter/material.dart';

class DateState {
  final DateTime dateTime;
  final DateTime? fromDate;
  final DateTime? toDate;

  final TimeOfDay? fromTime;
  final TimeOfDay? toTime;
  final Duration? duration;

  DateState({
    this.fromTime,
    this.toTime,
    this.fromDate,
    this.toDate,
    required this.dateTime,
    this.duration,
  });

  DateState copyWith({
    DateTime? dateTime,
    DateTime? fromDate,
    DateTime? toDate,
    TimeOfDay? fromTime,
    TimeOfDay? toTime,
    Duration? duration,
  }) {
    return DateState(
      dateTime: dateTime ?? this.dateTime,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      fromTime: fromTime ?? this.fromTime,
      toTime: toTime ?? this.toTime,
      duration: duration ?? this.duration,
    );
  }
}
