import 'package:employee_portal_mobile_app/feature/loan/presentation/screen/all_loan_widget.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/screen/provide_cubit.dart';
import 'export_file.dart';

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
                return AllAdministrativeRequestWidget();
              }
              if(state == 2) {
                return AllPerMissionRequestWidget();
              }
              if(state == 3) {
                return AllOverTimeRequestWidget();
              }
              if(state == 5) {
                return AllLoanWidget();
              }
              if(state == 6) {
                return const AllFinancialRequestWidget();
              }
              if(state == 7) {
                return const AllMissionRequestWidget();
              }
              return Text(state.toString());
            },
          ))),
    );
  }
}

