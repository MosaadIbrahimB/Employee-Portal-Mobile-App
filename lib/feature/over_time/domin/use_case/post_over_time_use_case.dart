import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/model/post/request_post_over_time_model.dart';
import '../../data/model/post/response_post_over_time_model.dart';
import '../repository/over_time_repository.dart';

class PostOverTimeUseCase{
  OverTimeRepository overTimeRepository;
  PostOverTimeUseCase({required this.overTimeRepository});
  Future<Either<Failure, ResponsePostOverTimeModel>> call({
    required RequestPostOverTimeModel requestPostOverTimeModel,
  }){
    return overTimeRepository.postOverTimeRequest(requestPostOverTimeModel: requestPostOverTimeModel);
  }

}