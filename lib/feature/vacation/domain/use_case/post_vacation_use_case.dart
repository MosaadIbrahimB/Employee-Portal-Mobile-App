import 'package:dartz/dartz.dart';
import 'package:employee_portal_mobile_app/core/error/failure.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/post_vacation_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/response_post_vacation_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/domain/repository/vacation_repository.dart';

class PostVacationUseCase  {
  VacationRepository vacationRepository;
  PostVacationUseCase(this.vacationRepository);


  Future<Either<Failure, ResponsePostVacationModel>> call({required PostVacationModel postVacationModel}){
    return vacationRepository.postVacation(postVacationModel: postVacationModel);
  }

}
