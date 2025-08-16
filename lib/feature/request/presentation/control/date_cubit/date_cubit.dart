import 'package:flutter_bloc/flutter_bloc.dart';
import 'date_state.dart';

class DateCubit extends Cubit<DateState> {
  DateCubit()
      :super(DateState(dateTime: DateTime.now()));


  void updateDate(DateTime date) {
    emit(state.copyWith(dateTime: date));
  }
  setFromDate(DateTime date) {
    emit(state.copyWith(fromDate: date));
  }
  setToDate(DateTime date) {
    emit(state.copyWith(toDate: date));
  }


}
