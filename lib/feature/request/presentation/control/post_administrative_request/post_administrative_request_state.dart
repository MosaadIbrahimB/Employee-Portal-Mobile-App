import 'package:employee_portal_mobile_app/feature/request/data/model/response_post_administrative_request.dart';
import 'package:equatable/equatable.dart';

class PostAdministrativeRequestState extends Equatable {
  final bool isLoading;
  final ResponsePostAdministrativeRequest? response;
  final String? errorMessage;

  const PostAdministrativeRequestState({
    this.isLoading = false,
    this.response,
    this.errorMessage,
  })  ;

  PostAdministrativeRequestState copyWith({
    bool? isLoading,
    ResponsePostAdministrativeRequest? response,
    String? errorMessage,
  }) {

    return PostAdministrativeRequestState(
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

