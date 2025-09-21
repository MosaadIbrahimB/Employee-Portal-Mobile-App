import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import '../../../request/presentation/control/tab_switcher/tab_switcher_cubit.dart';
import '../widget/add_loan_widget/add_loan_widget.dart';
import '../widget/tab_credits_loan_request/tab_credits_loan_widget.dart';
import '../widget/tab_loan_request/tab_loan_widget.dart';

class AllLoanWidget extends StatelessWidget {
  const AllLoanWidget({super.key});

  static final List<Widget> listBody = [
    // AddOverTimeWidget(),
    // TabOverTimeWidget(),
    // TabCreditsOverTimeWidget(),
    // DetailsItemOverTimeWidget(),
    // DetailsAlertOverTimeWidget(),
    TabLoanWidget(),
    TabCreditsLoanWidget(),
    AddLoanWidget()
    // Center(child: Text('AllLoanWidget'),)
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











