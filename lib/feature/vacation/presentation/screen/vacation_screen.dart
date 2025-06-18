import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/get_employee_vacations/get_employee_vacations_cubit.dart';

import '../../data/model/get_employee_vacations_model/get_employee_vacations_model.dart';
import '../control/get_employee_vacations/get_employee_vacations_state.dart';
import 'import_file.dart';

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
        BlocProvider(create: (context) => sl<VacationCubit>()),
        BlocProvider(create: (context) => VacationTabCubit()),
        BlocProvider(
          create: (context) => sl<VacationTypeCubit>()..fetchVacationTypes(),
        ),
        BlocProvider(
          create:
              (context) => sl<DefaultReviewerCubit>()..fetchDefaultReviewers(),
        ),
        BlocProvider(create: (context) => sl<PostVacationCubit>()),
        BlocProvider(create: (context) => sl<CalculateVacationDurationCubit>()),
        BlocProvider(create: (context) => sl<DateCubit>()),
        BlocProvider(create: (context) => sl<ValidateVacationCubit>()),
        BlocProvider(create: (context) => sl<CheckHandledAlertsCubit>()),
        BlocProvider(
          create:
              (context) =>
                  sl<GetEmployeeVacationsCubit>()..getEmployeeVacations(),
        ),
      ],
      child: BlocBuilder<VacationCubit, int>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20.0).r,
            child: BlocBuilder<
              GetEmployeeVacationsCubit,
              GetEmployeeVacationsState
            >(
              builder: (context, state) {
                List<GetEmployeeVacationsModel> vacations =
                    state.response ?? [];
                return SingleChildScrollView(
                  child: vacations.isEmpty ? body[0] : body[2],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
