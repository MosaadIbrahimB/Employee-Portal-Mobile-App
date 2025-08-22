import 'package:employee_portal_mobile_app/feature/mission_request/presentation/control/post_mission_request/post_mission_request_state.dart';
import 'package:employee_portal_mobile_app/feature/permission_request/presentation/control/post_permission_request/post_permission_request_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/post/request_post_permission_model.dart';
import '../../../domain/use_case/post_permission_use_case.dart';

class PostPerMissionRequestCubit extends Cubit<PostPerMissionRequestState> {
  final PostPermissionUseCase postUseCase;

  PostPerMissionRequestCubit(this.postUseCase) : super(PostPerMissionRequestState());

  static final TextEditingController noteInputController = TextEditingController();
  final TextEditingController employSecondController = TextEditingController();
  static final TextEditingController destinationController = TextEditingController();
  static final TextEditingController durationController = TextEditingController();

  Future<void> postPreMissionRequest({
    required RequestPostPermissionModel requestMission,
  }) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await postUseCase(requestMission);

    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, errorMessage: failure.message)),
      (response) => emit(state.copyWith(isLoading: false, response: response)),
    );
  }
}
