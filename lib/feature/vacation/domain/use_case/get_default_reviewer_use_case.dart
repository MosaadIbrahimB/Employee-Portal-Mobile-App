import 'package:dartz/dartz.dart';
import 'package:employee_portal_mobile_app/core/error/failure.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/default_reviewer_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/request_default_reviewer_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/domain/repository/vacation_repository.dart';

class GetDefaultReviewerUseCase {
  VacationRepository vacationRepository;

  GetDefaultReviewerUseCase(this.vacationRepository);

  Future<Either<Failure, List<DefaultReviewerModel>>> call(
      {required RequestDefaultReviewerModel requestDefaultReviewerModel}
      ) async {
    return await vacationRepository.getDefaultReviewer(
      requestDefaultReviewerModel: requestDefaultReviewerModel
    );
  }


}
