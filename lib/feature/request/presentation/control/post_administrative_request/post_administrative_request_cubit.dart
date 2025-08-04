import 'package:employee_portal_mobile_app/feature/request/domain/use_case/post_administrative_request_use_case.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/control/post_administrative_request/post_administrative_request_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../data/model/request_post_administrative_request_model.dart';

class PostAdministrativeRequestCubit
    extends Cubit<PostAdministrativeRequestState> {
  final PostAdministrativeRequestUseCase postAdministrativeRequestUseCase;

  PostAdministrativeRequestCubit(this.postAdministrativeRequestUseCase)
    : super(
        PostAdministrativeRequestState(),
      ); // سيحسب start/end/duration تلقائيًا

  static final TextEditingController noteInputController = TextEditingController();
  final TextEditingController employSecondController = TextEditingController();

  Future<void> postAdministrativeRequest({
    required RequestPostAdministrativeRequestModel
    requestPostAdministrativeRequestModel,
  }) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await postAdministrativeRequestUseCase(
      requestPostAdministrativeRequestModel:
          requestPostAdministrativeRequestModel,
    );

    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, errorMessage: failure.message)),
      (response) => emit(state.copyWith(isLoading: false, response: response)),
    );
  }
}
