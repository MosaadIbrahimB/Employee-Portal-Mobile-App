import 'package:employee_portal_mobile_app/core/component/input_data_widget.dart';
import 'package:employee_portal_mobile_app/core/component/input_date_day_widget.dart';
import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/person/presentation/widget/tab_of_app_bar_switcher.dart';
import 'package:employee_portal_mobile_app/feature/request/control/tab_switcher/tab_switcher_cubit.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/add_request/add_request_type_widget.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/request_tab_of_app_bar_switcher.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/request_type/management_request/app_bar_management_request_widget.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/request_type/management_request/management_request_widget.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/request_type/management_request/tab_credits_management_request/tab_credits_management_request_widget.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/request_type/management_request/tab_mangement_request/tab_management_request_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllManagementRequestWidget extends StatelessWidget {
  const AllManagementRequestWidget({super.key});

  static final List<Widget> listBody = [
    TabManagementRequestWidget(),
    TabCreditsManagementRequestWidget(),
    ManagementRequestWidget()
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











