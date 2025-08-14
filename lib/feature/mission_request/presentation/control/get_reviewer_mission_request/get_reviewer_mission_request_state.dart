import 'package:employee_portal_mobile_app/feature/financial_request/data/model/response_financial_model.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/response_mission_model.dart';

class GetReviewerMissionRequestState extends Equatable{
  final bool ?isLoading ;
  final  String? errorMessage;
  final List<ResponseMissionModel>? response;


  const GetReviewerMissionRequestState({ this.isLoading= false, this.errorMessage, this.response});


  copyWith({
    bool? isLoading,
    String? errorMessage,
    List<ResponseMissionModel>? response,

  }) {
    return GetReviewerMissionRequestState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      response: response ?? this.response,
    );

  }
  @override
  List<Object?> get props => [response, isLoading, errorMessage];

}