import 'package:equatable/equatable.dart';
import '../../../data/model/post/response_post_over_time_model.dart';

class PostOverTimeRequestState extends Equatable {
  final bool ?isLoading;
  final List<ResponsePostOverTimeModel>? response;
  final String? errorMessage;

  const PostOverTimeRequestState({
    this.isLoading = false,
    this.response,
    this.errorMessage,
  })  ;

  PostOverTimeRequestState copyWith({
    bool? isLoading,
    final List<ResponsePostOverTimeModel>? response,
    String? errorMessage,
  }) {

    return PostOverTimeRequestState(
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

