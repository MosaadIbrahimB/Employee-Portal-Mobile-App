import 'package:employee_portal_mobile_app/feature/financial_request/data/model/response_post_financial_request.dart';
import 'package:equatable/equatable.dart';

class PostFinancialRequestState extends Equatable {
  final bool isLoading;
  final ResponsePostFinancialRequest? response;
  final String? errorMessage;

  const PostFinancialRequestState({
    this.isLoading = false,
    this.response,
    this.errorMessage,
  })  ;

  PostFinancialRequestState copyWith({
    bool? isLoading,
    ResponsePostFinancialRequest? response,
    String? errorMessage,
  }) {

    return PostFinancialRequestState(
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

