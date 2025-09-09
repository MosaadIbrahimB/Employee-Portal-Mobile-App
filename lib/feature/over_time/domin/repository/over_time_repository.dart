import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/model/alert_model.dart';
import '../../data/model/post/request_post_over_time_model.dart';
import '../../data/model/post/response_post_over_time_model.dart';
import '../../data/model/response_over_time_model.dart';
import '../../data/model/type_over_time_model.dart';

abstract class OverTimeRepository {
  Future<Either<Failure, List<TypeOverTimeModel>>>
  getTypeOverTime();



  Future<Either<Failure, List<ResponseOverTimeModel>>> getEmployeeOverTimeRequest();

  Future<Either<Failure, List<ResponseOverTimeModel>>> getReviewerOverTimeRequest();

  Future<Either<Failure, ResponsePostOverTimeModel>> postOverTimeRequest({
    required RequestPostOverTimeModel requestPostOverTimeModel,
  });

  Future<Either<Failure, AlertModel>> getAlertOverTimeRequest({
    int? id,
  });

  Future<Either<Failure, List<AlertModel>>> getAlertsOverTimeRequest({
    String? fromDate,
    String? toDate,
  });
}
