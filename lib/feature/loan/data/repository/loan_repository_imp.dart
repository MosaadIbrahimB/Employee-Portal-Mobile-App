import 'package:dartz/dartz.dart';
import 'package:employee_portal_mobile_app/core/error/failure.dart';
import 'package:employee_portal_mobile_app/feature/loan/data/model/get_loan_model.dart';
import 'package:employee_portal_mobile_app/feature/loan/data/model/loan_type_model.dart';
import 'package:employee_portal_mobile_app/feature/loan/data/model/post/post_loan_request_model.dart';
import 'package:employee_portal_mobile_app/feature/loan/data/model/post/post_loan_response_model.dart';
import 'package:employee_portal_mobile_app/feature/loan/data/model/response_loan_model.dart';
import 'package:employee_portal_mobile_app/feature/loan/data/model/valid/validate_loan_request_model.dart';
import 'package:employee_portal_mobile_app/feature/loan/data/model/valid/validate_loan_response_model.dart';
import 'package:employee_portal_mobile_app/feature/loan/domain/repository/loan_repository.dart';

import '../data_source/loan_remote_data_source.dart';

class LoanRepositoryImp implements LoanRepository  {

  LoanRemoteDataSource loanRemoteDataSource;

  LoanRepositoryImp({required this.loanRemoteDataSource});





  @override
  Future<Either<Failure, List<LoanModel>>> getEmployeeLoan()
  async {
    try {
      final result =
      await loanRemoteDataSource.getEmployeeLoan();
      return right(result);
    } catch (e) {
      return left(
        ServerFailure(
          "${e.toString()}حدث خطأ في الخادم getEmployeeLoan  ",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<GetLoanModel>>> getLoan()
  async {
    try {
      final result =
      await loanRemoteDataSource.getLoan();
      return right(result);
    } catch (e) {
      return left(
        ServerFailure(
          "${e.toString()}حدث خطأ في الخادم getLoan  ",
        ),
      );
    }
  }



  @override
  Future<Either<Failure, List<LoanTypeModel>>> getLoanType()
  async {
    try {
      final result =
      await loanRemoteDataSource.getLoanType();
      return right(result);
    } catch (e) {
      return left(
        ServerFailure(
          "${e.toString()}حدث خطأ في الخادم getLoanType  ",
        ),
      );
    }
  }


  @override
  Future<Either<Failure, List<LoanModel>>> getReviewerLoan()
  async {
    try {
      final result =
      await loanRemoteDataSource.getReviewerLoan();
      return right(result);
    } catch (e) {
      return left(
        ServerFailure(
          "${e.toString()}حدث خطأ في الخادم getReviewerLoan  ",
        ),
      );
    }
  }


  @override
  Future<Either<Failure, PostLoanResponseModel>> postLoan({required PostLoanRequestModel requestPostLoanModel})

  async {
    try {
      final result = await loanRemoteDataSource.postLoan(
        requestPostLoanModel: requestPostLoanModel,
      );
      return right(result);
    } catch (e) {
      return left(
        ServerFailure(e.toString()),
      );
    }
  }


  @override
  Future<Either<Failure, ValidateLoanResponseModel>> validateLoan({required ValidateLoanRequestModel requestModel})
  async {
    try {
      final result = await loanRemoteDataSource.validateLoan(
        requestModel: requestModel,
      );
      return right(result);
    } catch (e) {
      return left(
        ServerFailure(e.toString()),
      );
    }
  }}