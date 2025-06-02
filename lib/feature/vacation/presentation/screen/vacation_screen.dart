import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/vacation/control/vacation_cubit/vacation_cubit.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/widget/no_vacation_widget/no_vacation_widget.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/widget/vacation_request/vacation_request_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VacationScreen extends StatelessWidget {
  const VacationScreen({super.key});

  static final List<Widget>body = [
    const NoVacationWidget(),
    VacationRequestWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VacationCubit(),
      child: BlocBuilder<VacationCubit, int>(
        builder: (context, state) {
          return body[state];
        },
      ),
    );
  }
}




