
import 'package:flutter_bloc/flutter_bloc.dart';

class VacationCubit extends Cubit<int> {
  VacationCubit() : super(0);

  changeTab(int index) {
    emit(index);
  }

}