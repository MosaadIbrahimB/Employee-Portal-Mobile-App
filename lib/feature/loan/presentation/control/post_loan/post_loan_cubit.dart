import 'package:employee_portal_mobile_app/feature/loan/presentation/control/post_loan/post_loan_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/post/post_loan_request_model.dart';
import '../../../domain/use_case/post_loan_use_case.dart';

class PostLoanCubit extends Cubit<PostLoanState> {
  final PostLoanUseCase postLoanUseCase;

  PostLoanCubit({required this.postLoanUseCase}) : super(const PostLoanState());

  static final TextEditingController noteInputController =
      TextEditingController();
  static final TextEditingController totalMoneyController =
      TextEditingController();

  Future<void> postLoan({
    required PostLoanRequestModel postLoanRequestModel,
  }) async {
    emit(state.copyWith(isLoading: true, response: null, errorMessage: null));

    final result = await postLoanUseCase(
      postLoanRequestModel: postLoanRequestModel,
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


