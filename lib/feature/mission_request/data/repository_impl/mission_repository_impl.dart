import 'package:dartz/dartz.dart';
import 'package:employee_portal_mobile_app/core/error/failure.dart';
import 'package:employee_portal_mobile_app/feature/mission_request/data/model/post_mission/post_mission_request_model.dart';
import 'package:employee_portal_mobile_app/feature/mission_request/data/model/post_mission/response_post_mission_model.dart';
import 'package:employee_portal_mobile_app/feature/mission_request/data/model/response_mission_model.dart';
import '../../domain/repository/mission_repository.dart';
import '../data_source/remote/mission_request_remote_data_source.dart';

class MissionRepositoryImpl implements  MissionRequestRepository {
  MissionRequestRemoteDataSource missionRequestRemoteDataSource;

  MissionRepositoryImpl({
    required this.missionRequestRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<ResponseMissionModel>>> getMission() async {
    try {
      final result =
      await missionRequestRemoteDataSource.getMission();
      return right(result);
    } catch (e) {
      return left(
        ServerFailure("${e.toString()}حدث خطأ في الخادم getMission  "),
      );
    }
  }

  @override
  Future<Either<Failure,
      List<ResponseMissionModel>>> getEmployeeMissionRequests() async {
    try {
      final result =
      await missionRequestRemoteDataSource.getEmployeeMissionRequests();
      return right(result);
    } catch (e) {
      return left(
        ServerFailure(
            "${e.toString()}حدث خطأ في الخادم getEmployeeMissionRequests  "),
      );
    }
  }


  @override
  Future<Either<Failure,
      List<ResponseMissionModel>>> getReviewerMissionRequests() async {
    try {
      final result =
      await missionRequestRemoteDataSource.getReviewerMissionRequests();
      return right(result);
    } catch (e) {
      return left(
        ServerFailure(
            "${e.toString()}حدث خطأ في الخادم getReviewerMissionRequests  "),
      );
    }
  }

  @override
  Future<Either<Failure, ResponsePostMissionModel>> postMissionRequests(
      RequestPostMissionModel requestPostMissionModel) async {
    try {
      final result = await missionRequestRemoteDataSource
          .postMissionRequests(requestPostMissionModel);
      return right(result);
    } catch (e) {
      return left(
        ServerFailure("${e
            .toString()}حدث خطأ في الخادم postMissionRequests  "),
      );
    }
  }

}


