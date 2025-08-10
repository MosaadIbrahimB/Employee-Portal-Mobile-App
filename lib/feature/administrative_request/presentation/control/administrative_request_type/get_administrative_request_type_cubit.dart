import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:employee_portal_mobile_app/feature/administrative_request/data/model/administrative_request_type_model.dart';
import 'package:employee_portal_mobile_app/feature/administrative_request/domain/use_case/get_administrative_request_type_use_case.dart';

import 'get_administrative_request_type_state.dart';

class  GetAdministrativeRequestTypeCubit extends Cubit< GetAdministrativeRequestTypeState>{
  GetAdministrativeRequestTypeCubit({required this.getAdministrativeRequestUseCase}):super(GetAdministrativeRequestTypeState());
  GetAdministrativeRequestTypeUseCase  getAdministrativeRequestUseCase  ;
  List<AdministrativeRequestTypeModel>? _cachedRequestTypes; // كاش داخلي

  getAdministrativeRequest() async {
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

    final response = await getAdministrativeRequestUseCase();
    response.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, errorMessage: failure.message));
      },
      (resulte) {
        emit(state.copyWith(isLoading: false, response: resulte));
      },
    );
  }

  void selectedRequestType(AdministrativeRequestTypeModel selectedRequest) {
    emit(state.copyWith(selectedRequestType: selectedRequest));

  }

  void clearSelectedRequestType() {
    _cachedRequestTypes == null;
    emit(state.copyWith(selectedRequestType: null));
  }
}

