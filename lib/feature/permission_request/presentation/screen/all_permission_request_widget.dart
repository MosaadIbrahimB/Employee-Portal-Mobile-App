import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import '../../../request/presentation/control/tab_switcher/tab_switcher_cubit.dart';
import '../widget/add_permission_request_widget/add_permission_request_widget.dart';
import '../widget/tab_permission_request/tab_permission_request_widget.dart';

class AllPerMissionRequestWidget extends StatelessWidget {
  const AllPerMissionRequestWidget({super.key});

  static final List<Widget> listBody = [
    TabPerMissionRequestWidget(),
    // TabCreditsMissionRequestWidget(),
    // DetailsItemOfMissionRequestWidget(),
    Text("AllPerMissionRequestWidget"),
    Text("AllPerMissionRequestWidget"),

    AddPerMissionRequestWidget(),
    // Text("AllPerMissionRequestWidget")
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











