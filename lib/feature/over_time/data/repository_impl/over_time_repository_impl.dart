import 'package:dartz/dartz.dart';
import 'package:employee_portal_mobile_app/core/error/failure.dart';
import 'package:employee_portal_mobile_app/feature/over_time/data/model/alert_model.dart';
import 'package:employee_portal_mobile_app/feature/over_time/data/model/post/request_post_over_time_model.dart';
import 'package:employee_portal_mobile_app/feature/over_time/data/model/post/response_post_over_time_model.dart';
import 'package:employee_portal_mobile_app/feature/over_time/data/model/response_over_time_model.dart';
import 'package:employee_portal_mobile_app/feature/over_time/data/model/type_over_time_model.dart';
import '../../domin/repository/over_time_repository.dart';
import '../data_source/remote/over_time_remote_data_source.dart';

class OverTimeRepositoryImpl extends OverTimeRepository {
  OverTimeRequestRemoteDataSource overTimeRequestRemoteDataSource;

  OverTimeRepositoryImpl({
    required this.overTimeRequestRemoteDataSource,
  });


  @override
  Future<Either<Failure, AlertModel>> getAlertOverTimeRequest({int? id})
  async {
    try {
      final result =
      await overTimeRequestRemoteDataSource.getAlertOverTimeRequest(id: id);
      return right(result);
    } catch (e) {
      return left(
        ServerFailure("${e.toString()}حدث خطأ في الخادم getAlertOverTimeRequest  "),
      );
    }
  }

  @override
  Future<Either<Failure, List<AlertModel>>> getAlertsOverTimeRequest({
    String? fromDate,
    String? toDate,
  })
  async {
    try {
      final result =
      await overTimeRequestRemoteDataSource.getAlertsOverTimeRequest(fromDate: fromDate,toDate:toDate );
      return right(result);
    } catch (e) {
      return left(
        ServerFailure("${e.toString()}حدث خطأ في الخادم getAlertsOverTimeRequest  "),
      );
    }
  }


  @override
  Future<Either<Failure, List<ResponseOverTimeModel>>>
  getEmployeeOverTimeRequest()
  async {
    try {
      final result =
      await overTimeRequestRemoteDataSource.getEmployeeOverTimeRequest();
      return right(result);
    } catch (e) {
      return left(
        ServerFailure(
            "${e.toString()}حدث خطأ في الخادم getEmployeeOverTimeRequest  "),
      );
    }
  }


  @override
  Future<Either<Failure, List<ResponseOverTimeModel>>>
  getReviewerOverTimeRequest()
  async {
    try {
      final result =
      await overTimeRequestRemoteDataSource.getReviewerOverTimeRequest();
      return right(result);
    } catch (e) {
      return left(
        ServerFailure(
            "${e.toString()}حدث خطأ في الخادم getReviewerOverTimeRequest  "),
      );
    }
  }

  @override
  Future<Either<Failure, List<ResponsePostOverTimeModel>>> postOverTimeRequest({
    required RequestPostOverTimeModel requestPostOverTimeModel,
  })
  async {
    try {
      final result = await overTimeRequestRemoteDataSource
          .postOverTimeRequest(requestPostOverTimeModel:requestPostOverTimeModel );
      return right(result);
    } catch (e) {
      return left(
        ServerFailure("${e
            .toString()}حدث خطأ في الخادم postOverTimeRequest  "),
      );
    }
  }

  @override
  Future<Either<Failure, List<TypeOverTimeModel>>> getTypeOverTime()
  async {
    try {
      final result =
      await overTimeRequestRemoteDataSource.getTypeOverTime();
      return right(result);
    } catch (e) {
      return left(
        ServerFailure("${e.toString()}حدث خطأ في الخادم getTypeOverTime  "),
      );
    }
  }

}
