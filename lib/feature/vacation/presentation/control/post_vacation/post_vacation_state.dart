import 'package:employee_portal_mobile_app/feature/vacation/data/model/response_post_vacation_model.dart';
import 'package:equatable/equatable.dart';

class PostVacationState extends Equatable {
  final bool isLoading;
  final ResponsePostVacationModel? response;
  final String? errorMessage;
  final DateTime startDate;
  final DateTime endDate;
  final int duration;

   PostVacationState({
    this.isLoading = false,
    this.response,
    this.errorMessage,
    DateTime? startDate,
    DateTime? endDate,
    int? duration,
  })  : startDate = startDate ?? DateTime.now(),
        endDate = endDate ?? DateTime.now(),
        duration = duration ?? 1;

  PostVacationState copyWith({
    bool? isLoading,
    ResponsePostVacationModel? response,
    String? errorMessage,
    DateTime? startDate,
    DateTime? endDate,
    int? duration,
  }) {
    final newStart = startDate ?? this.startDate;
    final newEnd = endDate ?? this.endDate;
    final newDuration = duration ?? (newEnd.difference(newStart).inDays + 1);

    return PostVacationState(
      isLoading: isLoading ?? this.isLoading,
      response: response ?? this.response,
      errorMessage: errorMessage ?? this.errorMessage,
      startDate: newStart,
      endDate: newEnd,
      duration: newDuration,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    response,
    errorMessage,
    startDate,
    endDate,
    duration,
  ];
}
