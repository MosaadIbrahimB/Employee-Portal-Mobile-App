import 'package:employee_portal_mobile_app/feature/financial_request/data/model/response_post_financial_request.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/post/response_post_permission_model.dart';


class PostPerMissionRequestState extends Equatable {
  final bool ?isLoading;
  final ResponsePostPermissionModel? response;
  final String? errorMessage;

  const PostPerMissionRequestState({
    this.isLoading = false,
    this.response,
    this.errorMessage,
  })  ;

  PostPerMissionRequestState copyWith({
    bool? isLoading,
    ResponsePostPermissionModel? response,
    String? errorMessage,
  }) {

    return PostPerMissionRequestState(
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

