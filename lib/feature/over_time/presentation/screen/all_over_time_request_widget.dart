import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import '../../../request/presentation/control/tab_switcher/tab_switcher_cubit.dart';
import '../widget/add_over_time_widget/add_over_time_widget.dart';
import '../widget/tab_credits_over_time/tab_credits_over_time_widget.dart';
import '../widget/tab_over_time/tab_over_timet_widget.dart';

class AllOverTimeRequestWidget extends StatelessWidget {
  const AllOverTimeRequestWidget({super.key});

  static final List<Widget> listBody = [
    // TabMissionRequestWidget(),
    // TabCreditsMissionRequestWidget(),
    // DetailsItemOfMissionRequestWidget(),
    // AddMissionRequestWidget(),
    AddOverTimeWidget(),
    TabOverTimeWidget(),
    TabCreditsOverTimeWidget()
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











