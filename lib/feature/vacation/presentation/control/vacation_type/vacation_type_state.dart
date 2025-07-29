import 'package:employee_portal_mobile_app/feature/vacation/data/model/vacation_type/vacation_type_model.dart';
import 'package:equatable/equatable.dart';

class VacationTypeState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final List<VacationTypeModel> vacationTypes;
  final VacationTypeModel? selectedVacation;

  const VacationTypeState({
    this.vacationTypes = const [],
    this.selectedVacation,
    this.isLoading = false,
    this.errorMessage,
  });

  VacationTypeState copyWith({
    List<VacationTypeModel>? vacationTypes,
    VacationTypeModel? selectedVacation,
    bool? isLoading,
    String? errorMessage,
  }) {
    return VacationTypeState(
      vacationTypes: vacationTypes ?? this.vacationTypes,
      selectedVacation: selectedVacation ?? this.selectedVacation,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [vacationTypes, selectedVacation, isLoading, errorMessage];
}
