import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/request_screen_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/service/dependency_injection/depend_inject.dart';
import '../../../management_request/tab_mangement_request/all_management_request_widget.dart';
import '../../../vacation/presentation/control/default_reviewer/default_reviewer_cubit.dart';
import '../control/financial_request_type/get_financial_request_type_cubit.dart';
import '../control/get_employee_administrative_request/get_employee_administrative_request_cubit.dart';
import '../control/request/request_cubit.dart';
import '../control/tab_switcher/tab_switcher_cubit.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: provideCubit(),
      child: SafeArea(child: SingleChildScrollView(
          child: BlocBuilder<RequestCubit, int>(
            builder: (context, state) {
              if(state == 0) {
                return RequestScreenBody();
              }
              if(state == 1) {
                return AllManagementRequestWidget();
              }
              return Text("3");
            },
          ))),
    );
  }

  provideCubit() {
    return [
      BlocProvider<RequestCubit>(create: (context) => RequestCubit()),
      BlocProvider<TabSwitcherCubit>(create: (context) => TabSwitcherCubit()),
      BlocProvider(
        create:
            (context) =>
        sl<GetFinancialRequestTypeCubit>()
          ..getFinancialRequest(),
      ),
      BlocProvider(
        create:
            (context) =>
        sl<GetEmployeeAdministrativeRequestCubit>()
          ..getEmployeeAdministrativeRequest(),
      ),
      BlocProvider(
        create:
            (context) => sl<DefaultReviewerCubit>()..fetchDefaultReviewers(),
      ),

    ];
  }
}
