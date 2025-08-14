import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import '../../../financial_request/presentation/widget/add_financial_request/add_financial_request_widget.dart';
import '../../../request/presentation/control/tab_switcher/tab_switcher_cubit.dart';
import '../widget/tab_credits_mission_request/tab_credits_mission_request_widget.dart';
import '../widget/tab_mission_request/tab_mission_request_widget.dart';

class AllMissionRequestWidget extends StatelessWidget {
  const AllMissionRequestWidget({super.key});

  static final List<Widget> listBody = [
    TabMissionRequestWidget(),
    TabCreditsMissionRequestWidget(),
    AddFinancialRequestWidget(),
    // DetailsItemOfRequestWidget()
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Padding(
      padding: const EdgeInsets.all(8.0).r,
      child: BlocBuilder<TabSwitcherCubit, int>(
        builder: (context, state) {
          // return Center(
          //   child: Text("Mission Request"),
          //
          // );
          return listBody[state];
        },
      ),
    ),);
  }
}











