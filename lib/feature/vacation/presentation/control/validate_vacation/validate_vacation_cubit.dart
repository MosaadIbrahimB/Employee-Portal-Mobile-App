import 'package:employee_portal_mobile_app/feature/vacation/data/model/validate_vacation/validate_vacation_request_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/domain/use_case/validate_vacation.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/validate_vacation/validate_vacation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ValidateVacationCubit extends Cubit<ValidateVacationState> {
  final ValidateVacationUseCase validateVacationUseCase;

  ValidateVacationCubit(this.validateVacationUseCase) : super(ValidateVacationInitial());

  Future<void> validate(ValidateVacationRequestModel model) async {
    emit(ValidateVacationLoading());
    final result = await validateVacationUseCase(model);
    result.fold(
          (failure) => emit(ValidateVacationError(failure.message)),
          (data) => emit(ValidateVacationSucceed(data)),
    );
  }
}
