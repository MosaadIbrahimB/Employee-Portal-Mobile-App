import 'package:employee_portal_mobile_app/feature/over_time/presentation/control/post_over_time/post_over_time_request_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/post/request_post_over_time_model.dart';
import '../../../domin/use_case/post_over_time_use_case.dart';



class PostOverTimeRequestCubit extends Cubit<PostOverTimeRequestState> {
  final PostOverTimeUseCase postOverTimeUseCase;

  PostOverTimeRequestCubit(this.postOverTimeUseCase)
      : super(const PostOverTimeRequestState());

  static final TextEditingController noteInputController =
  TextEditingController();

  Future<void> postOverTimeRequest({
    required RequestPostOverTimeModel requestPostOverTimeModel,
  }) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await postOverTimeUseCase(
      requestPostOverTimeModel: requestPostOverTimeModel,
    );

    result.fold(
          (failure) {
        emit(state.copyWith(isLoading: false, errorMessage: failure.message));
      },
          (responseList) {
        emit(state.copyWith(isLoading: false, response: responseList));
      },
    );
  }
}


