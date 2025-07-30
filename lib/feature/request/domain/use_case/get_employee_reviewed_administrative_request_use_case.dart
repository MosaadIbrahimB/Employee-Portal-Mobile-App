import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/model/employee_reviewed_financial_request_model.dart';
import '../repository/request_repository.dart';

class GetEmployeeReviewedAdministrativeRequestUseCase {
  RequestRepository requestRepository;


  GetEmployeeReviewedAdministrativeRequestUseCase({required this.requestRepository});


  Future<Either<Failure, List<EmployeeReviewedFinancialRequestModel>>> call() async {
    return await requestRepository.getEmployeeReviewedAdministrativeRequest();
  }

}
