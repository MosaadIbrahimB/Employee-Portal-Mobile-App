import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/default_reviewer_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/post_vacation_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/domain/use_case/post_vacation_use_case.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/date_cubit/date_cubit.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/default_reviewer/default_reviewer_cubit.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/post_vacation/post_vacation_state.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/vacation_type/vacation_type_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostVacationCubit extends Cubit<PostVacationState> {
  final PostVacationUseCase postVacationUseCase;

  PostVacationCubit(this.postVacationUseCase)
      : super(PostVacationState()); // سيحسب start/end/duration تلقائيًا

  void updateDates({DateTime? start, DateTime? end}) {
    final newStart = start ?? state.startDate;
    final newEnd = end ?? state.endDate;
    final newDuration = newEnd.difference(newStart).inDays + 1;

    emit(state.copyWith(
      startDate: newStart,
      endDate: newEnd,
      duration: newDuration,
    ));
  }


  final TextEditingController noteInputController = TextEditingController();

  Future<void> postVacation(BuildContext context) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final postVacationModel = PostVacationModel(
      vacationTypeId: context.read<VacationTypeCubit>().state.selectedVacation?.id,
      fromDate: context.read<DateCubit>().state.fromDate.toString(),
      toDate: context.read<DateCubit>().state.toDate.toString(),
      duration: state.duration,
      notes: noteInputController.text,
      request: RequestModel(
        reviewers: context.read<DefaultReviewerCubit>().state.reviewers
            .map((reviewer) => DefaultReviewerModel(
          id: reviewer.id,
          name: reviewer.name,
        ))
            .toList(),
      ),
    );

    final result = await postVacationUseCase(postVacationModel: postVacationModel);

    result.fold(
          (failure) => emit(state.copyWith(isLoading: false, errorMessage: failure.message)),
          (response) => emit(state.copyWith(isLoading: false, response: response)),
    );
  }
}
