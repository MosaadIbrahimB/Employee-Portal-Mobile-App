import 'package:equatable/equatable.dart';
import '../../../data/model/post/post_loan_response_model.dart';

class PostLoanState extends Equatable {
  final bool ?isLoading;
  final PostLoanResponseModel? response;
  final String? errorMessage;

  const PostLoanState({
    this.isLoading = false,
    this.response,
    this.errorMessage,
  })  ;

  PostLoanState copyWith({
    bool? isLoading,
    final PostLoanResponseModel? response,
    String? errorMessage,
  }) {

    return PostLoanState(
      isLoading: isLoading?? this.isLoading,
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

