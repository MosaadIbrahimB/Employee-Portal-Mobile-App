import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/model/alert_model.dart';
import '../../data/model/request_alert_model.dart';
import '../repository/over_time_repository.dart';

class GetAlertOverTimeUseCase {
  OverTimeRepository repository;
  GetAlertOverTimeUseCase({required this.repository});

  Future<Either<Failure, AlertModel>> call({
    required RequestAlertModel requestAlertModel,
    int? id,
  }) {
    return repository.getAlertOverTimeRequest(
      requestAlertModel: requestAlertModel,
      id: id,
    );
  }
}
