import 'package:employee_portal_mobile_app/feature/administrative_request/presentation/widget/add_administrative_request/add_administrative_request_widget.dart';
import 'package:employee_portal_mobile_app/feature/administrative_request/presentation/widget/tab_administrative_request/tab_administrative_request_widget.dart';
import '../../../layout/export_layout_file.dart';
import '../../../request/presentation/control/tab_switcher/tab_switcher_cubit.dart';
import '../widget/details_administrative_request/details_item_of_request_widget.dart';
import '../widget/tab_credits_administrative_request/tab_credits_administrative_request_widget.dart';
class AllAdministrativeRequestWidget extends StatelessWidget {
  const AllAdministrativeRequestWidget({super.key});

  static final List<Widget> listBody = [
    TabAdministrativeRequestWidget(),
    TabCreditsAdministrativeRequestWidget(),
    AddAdministrativeRequestWidget(),
    DetailsItemOfRequestWidget()
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











