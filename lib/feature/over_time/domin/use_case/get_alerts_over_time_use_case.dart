import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/model/alert_model.dart';
import '../../data/model/request_alert_model.dart';
import '../repository/over_time_repository.dart';

class GetAlertsOverTimeUseCase {
  OverTimeRepository repository;

  GetAlertsOverTimeUseCase({required this.repository});

  Future<Either<Failure, List<AlertModel>>> call({
    required RequestAlertModel requestAlertModel,
    String? fromDate,
    String? toDate,
  }) {
    return repository.getAlertsOverTimeRequest(
      requestAlertModel: requestAlertModel,
      fromDate: fromDate,
     toDate: toDate

    );
  }
}
