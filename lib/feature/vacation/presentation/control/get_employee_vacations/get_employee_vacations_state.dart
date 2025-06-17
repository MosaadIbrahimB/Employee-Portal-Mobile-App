
import 'package:employee_portal_mobile_app/feature/vacation/data/model/get_employee_vacations_model/get_employee_vacations_model.dart';

class GetEmployeeVacationsState{
  bool ?isLoading= false;
  String? errorMessage;
  List<GetEmployeeVacationsModel>? response;

  GetEmployeeVacationsState({this.isLoading, this.errorMessage, this.response});


  copyWith({
    bool? isLoading,
    String? errorMessage,
    List<GetEmployeeVacationsModel>? response,
  }) {
    return GetEmployeeVacationsState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      response: response ?? this.response,
    );

  }

}