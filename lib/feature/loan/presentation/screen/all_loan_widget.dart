import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import '../../../request/presentation/control/tab_switcher/tab_switcher_cubit.dart';

class AllLoanWidget extends StatelessWidget {
  const AllLoanWidget({super.key});

  static final List<Widget> listBody = [
    // AddOverTimeWidget(),
    // TabOverTimeWidget(),
    // TabCreditsOverTimeWidget(),
    // DetailsItemOverTimeWidget(),
    // DetailsAlertOverTimeWidget(),
    Center(child: Text('AllLoanWidget'),)
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Padding(
      padding: const EdgeInsets.all(8.0).r,
      child: BlocBuilder<TabSwitcherCubit, int>(
        builder: (context, state) {
          return listBody[state];
        },
      ),
    ),);
  }
}











