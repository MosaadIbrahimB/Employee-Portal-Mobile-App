import 'package:dartz/dartz.dart';
import 'package:employee_portal_mobile_app/core/error/failure.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/approve_cancel/approve_cancel_request_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/post_vacation/post_vacation_request_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/post_vacation/post_vacation_response_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/domain/repository/vacation_repository.dart';

class ApproveCancelRequestUseCase  {
  VacationRepository vacationRepository;
  ApproveCancelRequestUseCase(this.vacationRepository);


  Future<Either<Failure, bool>> call({required ApproveCancelRequestModel approveCancelRequestModel}) {
    return vacationRepository.approveCancelRequest(approveCancelRequestModel:approveCancelRequestModel );
  }

}
