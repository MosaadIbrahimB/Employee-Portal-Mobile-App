import 'package:employee_portal_mobile_app/feature/financial_request/data/model/response_post_financial_request.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/post_mission/response_post_mission_model.dart';

class PostMissionRequestState extends Equatable {
  final bool ?isLoading;
  final ResponsePostMissionModel? response;
  final String? errorMessage;

  const PostMissionRequestState({
    this.isLoading = false,
    this.response,
    this.errorMessage,
  })  ;

  PostMissionRequestState copyWith({
    bool? isLoading,
    ResponsePostMissionModel? response,
    String? errorMessage,
  }) {

    return PostMissionRequestState(
      isLoading: isLoading ,
      response: response ,
      errorMessage: errorMessage ,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    response,
    errorMessage,
  ];
}

