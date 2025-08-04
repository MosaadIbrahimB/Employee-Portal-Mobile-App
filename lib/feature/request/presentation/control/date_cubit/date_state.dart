class DateState {
  final DateTime dateTime;

  DateState({required this.dateTime, });




  DateState copyWith({DateTime? dateTime}) {
    return DateState(
      dateTime: dateTime ?? this.dateTime,
    );
  }
}