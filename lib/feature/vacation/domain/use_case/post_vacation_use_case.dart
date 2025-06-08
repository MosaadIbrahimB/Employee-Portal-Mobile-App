import 'package:dartz/dartz.dart';
import 'package:employee_portal_mobile_app/core/error/failure.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/post_vacation/post_vacation_request_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/post_vacation/post_vacation_response_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/domain/repository/vacation_repository.dart';

class PostVacationUseCase  {
  VacationRepository vacationRepository;
  PostVacationUseCase(this.vacationRepository);


  Future<Either<Failure, PostVacationResponseModel>> call({required PostVacationRequestModel postVacationModel}){
    return vacationRepository.postVacation(postVacationModel: postVacationModel);
  }

}
