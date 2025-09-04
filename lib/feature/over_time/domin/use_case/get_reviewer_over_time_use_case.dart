import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/model/response_over_time_model.dart';
import '../repository/over_time_repository.dart';

class GetReviewerOverTimeUseCase {
  OverTimeRepository overTimeRepository;
  GetReviewerOverTimeUseCase({required this.overTimeRepository});

  Future<Either<Failure, List<ResponseOverTimeModel>>> call()async{
    return await overTimeRepository.getReviewerOverTimeRequest();
  }


}
