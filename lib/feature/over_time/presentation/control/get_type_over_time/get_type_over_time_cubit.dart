import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/type_over_time_model.dart';
import '../../../domin/use_case/get_type_over_time_use_case.dart';
import 'get_type_over_time_state.dart';

class GetTypeOverTimeCubit extends Cubit<GetTypeOverTimeState> {
  GetTypeOverTimeCubit({required this.getTypeOverTimeUseCase})
    : super(GetTypeOverTimeState());
  GetTypeOverTimeUseCase getTypeOverTimeUseCase;

  getTypeOverTime() async {
    emit(state.copyWith(isLoading: true));
    final response = await getTypeOverTimeUseCase();
    response.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, errorMessage: failure.message));
      },
      (resulte) {
        emit(state.copyWith(isLoading: false, response: resulte));
      },
    );
  }


  selectedRequestType(TypeOverTimeModel requestType) {
    emit(state.copyWith(selectedRequestType: requestType));
  }
}
