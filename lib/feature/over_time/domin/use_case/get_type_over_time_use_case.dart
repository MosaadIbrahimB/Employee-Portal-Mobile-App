import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/model/type_over_time_model.dart';
import '../repository/over_time_repository.dart';

class GetTypeOverTimeUseCase {
  OverTimeRepository repository;
  GetTypeOverTimeUseCase({required this.repository});

  Future<Either<Failure, List<TypeOverTimeModel>>> call() {
    return repository.getTypeOverTime();
  }
}
