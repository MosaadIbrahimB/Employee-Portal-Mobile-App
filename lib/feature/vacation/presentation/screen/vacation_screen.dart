import 'package:employee_portal_mobile_app/core/service/dependency_injection/depend_inject.dart';
import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/date_cubit/date_cubit.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/default_reviewer/default_reviewer_cubit.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/post_vacation/post_vacation_cubit.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/vacation_cubit/vacation_cubit.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/vacation_tab/vacation_tab_cubit.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/vacation_type/vacation_type_cubit.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/validate_vacation/validate_vacation_cubit.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/widget/no_vacation_widget/no_vacation_widget.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/widget/vacation/body_tab_widget.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/widget/vacation_details/vacation_details_widget.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/widget/vacation_request/vacation_request_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../control/calculate_vacation_duration/calculate_vacation_duration_cubit.dart';

class VacationScreen extends StatelessWidget {
  const VacationScreen({super.key});

  static final List<Widget> body = [
    const NoVacationWidget(),
    const VacationRequestWidget(),
    const BodyTabWidget(),
    VacationDetailsWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => VacationCubit()),
        BlocProvider(create: (context) => VacationTabCubit()),
        BlocProvider(create: (context) => sl<VacationTypeCubit>()..fetchVacationTypes()),
        BlocProvider(create: (context) => sl<DefaultReviewerCubit>()),
        BlocProvider(create: (context) => sl<PostVacationCubit>()),
        BlocProvider(create: (context) => sl<CalculateVacationDurationCubit>()),
        BlocProvider(create: (context) => sl<DateCubit>()),
        BlocProvider(create: (context) => sl<ValidateVacationCubit>()),
      ],
      child: BlocBuilder<VacationCubit, int>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20.0).r,
            child: SingleChildScrollView(child: body[state]),
          );
        },
      ),
    );
  }
}
