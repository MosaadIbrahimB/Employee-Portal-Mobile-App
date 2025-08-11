
 import 'package:equatable/equatable.dart';

import '../../../data/model/response_mission_model.dart';


 class GetMissionRequestState extends Equatable{
   final bool ?isLoading ;
   final  String? errorMessage;
   final List<ResponseMissionModel>? response;
   final  ResponseMissionModel? selectedRequestType;


   const GetMissionRequestState({this.selectedRequestType, this.isLoading= false, this.errorMessage, this.response});


   copyWith({
     bool? isLoading,
     String? errorMessage,
     List<ResponseMissionModel>? response,
     ResponseMissionModel? selectedRequestType

   }) {
     return GetMissionRequestState(
         isLoading: isLoading ?? this.isLoading,
         errorMessage: errorMessage ?? this.errorMessage,
         response: response ?? this.response,
         selectedRequestType: selectedRequestType??this.selectedRequestType
     );

   }
   @override
   List<Object?> get props => [response, selectedRequestType, isLoading, errorMessage];

 }