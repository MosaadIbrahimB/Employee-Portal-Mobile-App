import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/vacation/control/vacation_cubit/vacation_cubit.dart';
import 'package:employee_portal_mobile_app/feature/vacation/control/vacation_tab/vacation_tab_cubit.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/widget/no_vacation_widget/no_vacation_widget.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/widget/vacation/body_tab_widget.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/widget/vacation/tab_all_vacation/tab_all_vacation_widget.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/widget/vacation/tab_credits_vacation/tab_credits_vacation_widget.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/widget/vacation_details/vacation_details_widget.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/widget/vacation_request/vacation_request_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
