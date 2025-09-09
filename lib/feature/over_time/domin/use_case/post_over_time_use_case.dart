import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/model/post/request_post_over_time_model.dart';
import '../../data/model/post/response_post_over_time_model.dart';
import '../repository/over_time_repository.dart';

class PostOverTimeUseCase{
  OverTimeRepository repository;
  PostOverTimeUseCase({required this.repository});

  Future<Either<Failure, List<ResponsePostOverTimeModel>>> call({
    required RequestPostOverTimeModel requestPostOverTimeModel,
  }){
    return repository.postOverTimeRequest(requestPostOverTimeModel: requestPostOverTimeModel);
  }
}