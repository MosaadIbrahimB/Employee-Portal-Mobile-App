import 'package:employee_portal_mobile_app/feature/request/data/model/financial_request_type_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_case/get_financial_request_use_case.dart';
import 'get_financial_request_type_state.dart';


class  GetFinancialRequestTypeCubit extends Cubit< GetFinancialRequestTypeState>{
  GetFinancialRequestTypeCubit({required this.getFinancialRequestUseCase}):super(GetFinancialRequestTypeState());
  GetFinancialRequestUseCase  getFinancialRequestUseCase  ;
  List<FinancialRequestTypeModel>? _cachedRequestTypes; // كاش داخلي

  getFinancialRequest() async {
    if (_cachedRequestTypes != null) {
      emit(state.copyWith(
        response: _cachedRequestTypes,
        selectedRequestType: _cachedRequestTypes!.isNotEmpty
            ? _cachedRequestTypes!.first
            : null,
        isLoading: false,
      ));
      return;
    }


    emit(state.copyWith(isLoading: true));
    final response = await getFinancialRequestUseCase();
    response.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, errorMessage: failure.message));
      },
      (resulte) {
        emit(state.copyWith(isLoading: false, response: resulte));
      },
    );
  }
  void selectedRequestType(FinancialRequestTypeModel selectedRequest) {
    emit(state.copyWith(selectedRequestType: selectedRequest));

  }
}

