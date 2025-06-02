import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/home/data/report_model.dart';
import 'package:employee_portal_mobile_app/feature/home/presentation/widget/report_widget/report_status_widget.dart';
import 'package:employee_portal_mobile_app/feature/vacation/control/vacation_cubit/vacation_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:employee_portal_mobile_app/feature/request/presentation/widget/request_type/management_request/app_bar_management_request_widget.dart';

class AppBarDetailsVacationWidget extends StatelessWidget {
  const AppBarDetailsVacationWidget({super.key, required this.reportModel});

  final ReportModel reportModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppBarManagementRequestWidget(
          title: reportModel.appBarTitle ?? "title",
          onTap: () {
            context.read<VacationCubit>().changeTab(2);
          },
        ),
        ReportStatusWidget(reportModel: reportModel, isDetailsScreen: true),
      ],
    );
  }
}
