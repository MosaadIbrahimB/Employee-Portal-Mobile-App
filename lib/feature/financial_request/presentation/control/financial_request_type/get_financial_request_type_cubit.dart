import 'package:employee_portal_mobile_app/feature/financial_request/data/model/financial_request_type_model.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/domain/use_case/get_financial_request_type_use_case.dart';
import 'package:employee_portal_mobile_app/feature/financial_request/presentation/control/financial_request_type/get_financial_request_type_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class  GetFinancialRequestTypeCubit extends Cubit< GetFinancialRequestTypeState>{
  GetFinancialRequestTypeCubit({required this.getFinancialRequestUseCase}):super(GetFinancialRequestTypeState());
  GetFinancialRequestTypeUseCase  getFinancialRequestUseCase  ;
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

  void clearSelectedRequestType() {
    _cachedRequestTypes == null;
    emit(state.copyWith(selectedRequestType: null));
  }
}

