import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/home/data/report_model.dart';
import 'package:employee_portal_mobile_app/feature/home/presentation/widget/report_widget.dart';
import 'package:employee_portal_mobile_app/feature/request/data/dropdown_cubit.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/found_request/custom_button_dropdown_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoundRequestWidget extends StatelessWidget {
  const FoundRequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DropdownCubit(),
  child: SizedBox(
      height: MediaQuery
          .sizeOf(context)
          .height * .70,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: ReportModel.listReport.length,
                  itemBuilder:
                      (context, index) =>
                      ReportWidget(
                        reportModel: ReportModel.listReport[index],
                      ),
                ),
              ),
              SizedBox(height: 75.h),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: CustomButtonDropdownWidget()
            ),
          ),
        ],
      ),
    ),
);
  }
}


