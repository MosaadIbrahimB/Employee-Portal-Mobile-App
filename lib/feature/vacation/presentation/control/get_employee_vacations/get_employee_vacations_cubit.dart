
import 'package:employee_portal_mobile_app/feature/vacation/domain/use_case/get_employee_vacations_use_case.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/get_employee_vacations/get_employee_vacations_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class GetEmployeeVacationsCubit extends Cubit<GetEmployeeVacationsState>{
  GetEmployeeVacationsCubit({required this.getEmployeeVacationsUseCase}):super(GetEmployeeVacationsState());
  GetEmployeeVacationsUseCase getEmployeeVacationsUseCase ;

  getEmployeeVacations() async {
    emit(state.copyWith(isLoading: true));
    final response = await getEmployeeVacationsUseCase();
    response.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, errorMessage: failure.message));
      },
      (vacations) {
        emit(state.copyWith(isLoading: false, response: vacations));
      },
    );
  }

}

