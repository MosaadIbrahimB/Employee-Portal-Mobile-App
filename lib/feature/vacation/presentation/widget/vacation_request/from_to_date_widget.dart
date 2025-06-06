import 'package:employee_portal_mobile_app/core/service/dependency_injection/package_export.dart';
import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/calculate_vacation_duration/calculate_vacation_duration_request_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/calculate_vacation_duration/calculate_vacation_duration_cubit.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/date_cubit/date_cubit.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/widget/vacation_request/vacation_input_date_day_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FromToDateWidget extends StatelessWidget {
  const FromToDateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VacationInputDateDayWidget(
          title: "من يوم",
          onDateSelected: (date) {
            context.read<DateCubit>().updateFromDate(date);
          },
        ),
        SizedBox(height: 16.h),
        VacationInputDateDayWidget(
          title: "الى يوم",
          onDateSelected: (date) {
            toDate(context, date);
          },
        ),
      ],
    );
  }

  toDate(BuildContext context,DateTime date) {
    context.read<DateCubit>().updateToDate(date);

    var dateCubit = context.read<DateCubit>().state;
    var vacationType = context.read<VacationTypeCubit>().state;

    CalculateVacationDurationRequestModel requestModel =
    CalculateVacationDurationRequestModel(
      fromDate: dateCubit.fromDate,
      toDate: dateCubit.toDate,
      vacationTypeId: vacationType.selectedVacation!.id ?? 676,
      unit: 1,
      //replacementId:136//رقم الموظف البديل
    );
    context.read<CalculateVacationDurationCubit>().calculateDuration(
      requestModel,
    );


  }
}
