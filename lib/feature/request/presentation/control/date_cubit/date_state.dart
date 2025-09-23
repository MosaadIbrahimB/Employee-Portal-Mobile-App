import 'package:flutter/material.dart';

class DateState {
  final DateTime dateTime;
  final DateTime? fromDate;
  final DateTime? toDate;

  final TimeOfDay? fromTime;
  final TimeOfDay? toTime;
  final Duration? duration;
  final String? formattedToDate;

  DateState({
    this.fromTime,
    this.toTime,
    this.fromDate,
    this.toDate,
    required this.dateTime,
    this.duration,
    this.formattedToDate,
  });

  DateState copyWith({
    DateTime? dateTime,
    DateTime? fromDate,
    DateTime? toDate,
    TimeOfDay? fromTime,
    TimeOfDay? toTime,
    Duration? duration,
    String? formattedToDate,
  }) {
    return DateState(
      dateTime: dateTime ?? this.dateTime,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      fromTime: fromTime ?? this.fromTime,
      toTime: toTime ?? this.toTime,
      duration: duration ?? this.duration,
      formattedToDate: formattedToDate ?? this.formattedToDate,
    );
  }
}
