import 'package:employee_portal_mobile_app/feature/request/data/model/financial_request_type_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_case/get_admin_request_type_use_case.dart';
import '../../../domain/use_case/get_financial_request_type_use_case.dart';
import 'get_admin_request_type_state.dart';


class  GetAdminRequestTypeCubit extends Cubit< GetAdminRequestTypeState>{
  GetAdminRequestTypeCubit({required this.getAdminRequestTypeUseCase}):super(GetAdminRequestTypeState());
  GetAdminRequestTypeUseCase  getAdminRequestTypeUseCase  ;
  List<FinancialRequestTypeModel>? _cachedRequestTypes; // كاش داخلي

  getAdminRequest() async {
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
    final response = await getAdminRequestTypeUseCase();
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

