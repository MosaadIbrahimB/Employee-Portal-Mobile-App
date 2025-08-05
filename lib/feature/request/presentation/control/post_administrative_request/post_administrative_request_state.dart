import 'package:employee_portal_mobile_app/feature/request/data/model/response_post_administrative_request.dart';
import 'package:equatable/equatable.dart';

class PostAdministrativeFinancialRequestState extends Equatable {
  final bool isLoading;
  final ResponsePostAdministrativeFinancialRequest? response;
  final String? errorMessage;

  const PostAdministrativeFinancialRequestState({
    this.isLoading = false,
    this.response,
    this.errorMessage,
  })  ;

  PostAdministrativeFinancialRequestState copyWith({
    bool? isLoading,
    ResponsePostAdministrativeFinancialRequest? response,
    String? errorMessage,
  }) {

    return PostAdministrativeFinancialRequestState(
      isLoading: isLoading ?? this.isLoading,
      response: response ?? this.response,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    response,
    errorMessage,
  ];
}

