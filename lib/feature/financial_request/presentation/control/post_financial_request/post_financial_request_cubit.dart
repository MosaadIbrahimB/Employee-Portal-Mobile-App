import 'package:employee_portal_mobile_app/feature/financial_request/data/model/request_post_financial_request_model.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/domain/use_case/post_financial_request_use_case.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/presentation/control/post_financial_request/post_financial_request_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';


class PostFinancialRequestCubit
    extends Cubit<PostFinancialRequestState> {
  final PostFinancialRequestUseCase postFinancialRequestUseCase;

  PostFinancialRequestCubit(this.postFinancialRequestUseCase)
    : super(
    PostFinancialRequestState(),
      ); // سيحسب start/end/duration تلقائيًا

  static final TextEditingController noteInputController = TextEditingController();
  final TextEditingController employSecondController = TextEditingController();

  Future<void> postFinancialRequest({
    required RequestPostFinancialRequestModel
    requestPostFinancialRequestModel,
  }) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await postFinancialRequestUseCase(
      requestPostFinancialRequestModel:
          requestPostFinancialRequestModel,
    );

    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, errorMessage: failure.message)),
      (response) => emit(state.copyWith(isLoading: false, response: response)),
    );
  }
}
