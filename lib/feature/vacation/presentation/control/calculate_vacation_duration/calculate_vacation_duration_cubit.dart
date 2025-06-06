import 'package:employee_portal_mobile_app/core/error/failure.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/calculate_vacation_duration/calculate_vacation_duration_request_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/calculate_vacation_duration/calculate_vacation_duration_response_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/domain/use_case/calculate_vacation_duration_use_case.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/calculate_vacation_duration/calculate_vacation_duration_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';

class CalculateVacationDurationCubit extends Cubit<CalculateVacationDurationState> {
  final CalculateVacationDurationUseCase calculateVacationDurationUseCase;

  CalculateVacationDurationCubit(this.calculateVacationDurationUseCase)
      : super(CalculateVacationDurationState());

  Future<void> calculateDuration(CalculateVacationDurationRequestModel request) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final Either<Failure, CalculateVacationDurationResponseModel> result =
    await calculateVacationDurationUseCase.call(request);

    result.fold(
          (failure) {
        emit(state.copyWith(
          isLoading: false,
          errorMessage: failure.message ?? "Unknown error",
          response: null,
        ));
      },
          (responseModel) {
        emit(state.copyWith(
          isLoading: false,
          response: responseModel,
          errorMessage: null,
        ));
      },
    );
  }
}
