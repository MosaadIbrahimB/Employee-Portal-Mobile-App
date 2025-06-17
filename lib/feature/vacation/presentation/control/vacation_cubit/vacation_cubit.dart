import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/get_employee_vacations_model/get_employee_vacations_model.dart';

class VacationCubit extends Cubit<int> {
  VacationCubit() : super(0);
  late GetEmployeeVacationsModel _getEmployeeVacationsModel;

  changeTab(int index) {
    emit(index);
  }

  setEmployeeVacationsModel(GetEmployeeVacationsModel model){
    _getEmployeeVacationsModel = model;
  }
  getEmployeeVacationsModel(){
    return _getEmployeeVacationsModel;
  }

}

