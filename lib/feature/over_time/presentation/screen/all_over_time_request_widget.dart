import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import '../../../request/presentation/control/tab_switcher/tab_switcher_cubit.dart';
import '../widget/add_over_time_widget/add_over_time_widget.dart';
import '../widget/details_item_over_time_widget/details_item_of_permission_request_widget.dart';
import '../widget/tab_credits_over_time/tab_credits_over_time_widget.dart';
import '../widget/tab_over_time/tab_over_timet_widget.dart';

class AllOverTimeRequestWidget extends StatelessWidget {
  const AllOverTimeRequestWidget({super.key});

  static final List<Widget> listBody = [
    AddOverTimeWidget(),
    TabOverTimeWidget(),
    TabCreditsOverTimeWidget(),
    DetailsItemOverTimeWidget(),
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











