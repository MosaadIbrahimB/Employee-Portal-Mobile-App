class DateState {
  final DateTime dateTime;
  final DateTime ?fromDate;
  final DateTime ?toDate;

  DateState({this.fromDate, this.toDate, required this.dateTime, });




  DateState copyWith({DateTime? dateTime, DateTime? fromDate, DateTime? toDate}) {
    return DateState(
      dateTime: dateTime ?? this.dateTime,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
    );
  }
}