import 'package:flutter/material.dart';

class DateState {
  final DateTime dateTime;

  final DateTime? fromDate;
  final TimeOfDay? fromTime;

  final DateTime? toDate;
  final TimeOfDay? toTime;

  final Duration? duration;

  final String? formattedToDate;

  DateState({
    required this.dateTime,
    this.fromDate,
    this.fromTime,
    this.toDate,
    this.toTime,
    this.duration,
    this.formattedToDate,
  });

  DateState copyWith({
    DateTime? dateTime,
    DateTime? fromDate,
    TimeOfDay? fromTime,
    DateTime? toDate,
    TimeOfDay? toTime,
    Duration? duration,
    String? formattedToDate,
  }) {
    return DateState(
      dateTime: dateTime ?? this.dateTime,
      fromDate: fromDate ?? this.fromDate,
      fromTime: fromTime ?? this.fromTime,
      toDate: toDate ?? this.toDate,
      toTime: toTime ?? this.toTime,
      duration: duration ?? this.duration,
      formattedToDate: formattedToDate ?? this.formattedToDate,
    );
  }
}
