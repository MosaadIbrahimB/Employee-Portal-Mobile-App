import 'package:employee_portal_mobile_app/feature/mission_request/presentation/control/post_mission_request/post_mission_request_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/post_mission/post_mission_request_model.dart';
import '../../../domain/use_case/post_mission_requests.dart';

class PostMissionRequestCubit extends Cubit<PostMissionRequestState> {
  final PostMissionUseCase postMissionUseCase;

  PostMissionRequestCubit(this.postMissionUseCase)
    : super(PostMissionRequestState()); // سيحسب start/end/duration تلقائيًا

  static final TextEditingController noteInputController =
      TextEditingController();
  final TextEditingController employSecondController = TextEditingController();
  static final TextEditingController destinationController = TextEditingController();
  static final TextEditingController durationController = TextEditingController();

  Future<void> postMissionRequest({
    required RequestPostMissionModel requestMission,
  }) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await postMissionUseCase(requestMission);

    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, errorMessage: failure.message)),
      (response) => emit(state.copyWith(isLoading: false, response: response)),
    );
  }
}
