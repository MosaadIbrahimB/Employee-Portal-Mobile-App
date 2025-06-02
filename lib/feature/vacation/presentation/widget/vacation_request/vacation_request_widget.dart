import 'package:employee_portal_mobile_app/core/component/input_data_widget.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/add_request/add_document_button_widget.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/add_request/user_info_widget.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/notes_input_field.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/request_type/management_request/app_bar_management_request_widget.dart';
import 'package:employee_portal_mobile_app/feature/splash/presentation/widget/custom_button_widget.dart';
import 'package:employee_portal_mobile_app/feature/vacation/control/vacation_cubit/vacation_cubit.dart';
import 'package:employee_portal_mobile_app/feature/vacation/control/vacation_tab/vacation_tab_cubit.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/widget/vacation_request/vacation_input_date_day_widget.dart';

import '../../../../layout/export_Layout_file.dart';

class VacationRequestWidget extends StatefulWidget {
  const VacationRequestWidget({super.key});

  @override
  State<VacationRequestWidget> createState() => _VacationRequestWidgetState();
}

class _VacationRequestWidgetState extends State<VacationRequestWidget> {
  final TextEditingController requestTypeController = TextEditingController();

  final TextEditingController timeController = TextEditingController();

  final TextEditingController noteInputController = TextEditingController();

  final TextEditingController accController = TextEditingController();

  final TextEditingController totalDayController = TextEditingController();

  final TextEditingController employSecondController = TextEditingController();

@override
  dispose() {
    requestTypeController.dispose();
    timeController.dispose();
    noteInputController.dispose();
    accController.dispose();
    totalDayController.dispose();
    employSecondController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12.h),
        AppBarManagementRequestWidget(
          title: "طلب اجازة",
          onTap: () {
            context.read<VacationCubit>().changeTab(0);
          },
        ),
        SizedBox(height: 20.h),
        InputDataWidget(
          suffixIcon: Icon(Icons.keyboard_arrow_down_rounded),
          title: "نوع الاجازة",
          hint: "اختر",
          controller: requestTypeController,
        ),
        SizedBox(height: 16.h),
        VacationInputDateDayWidget(title: "من يوم"),
        SizedBox(height: 16.h),
        VacationInputDateDayWidget(title: "الى يوم"),
        SizedBox(height: 16.h),

        InputDataWidget(
          title: "المدة",
          hint: "12 يوم",
          controller: totalDayController,
        ),
        SizedBox(height: 16.h),

        InputDataWidget(
          title: "الموظف البديل",
          hint: "مهدى غانم",
          controller: employSecondController,
        ),
        SizedBox(height: 16.h),
        NotesInputField(controller: accController),
        SizedBox(height: 16.h),
        AddDocumentButtonWidget(),
        SizedBox(height: 16.h),
        InputDataWidget(
          title: "اضافة مراجع",
          hint: "محمد طارق",
          suffixIcon: Padding(
            padding: const EdgeInsets.all(BorderSide.strokeAlignOutside),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffEDF9FF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12).r,
                  bottomLeft: Radius.circular(12).r,
                ),
              ),
              child: Icon(Icons.add, color: Color(0xff1783B5)),
            ),
          ),
          controller: accController,
        ),
        SizedBox(height: 16.h),
        UserInfoWidget(),
        SizedBox(height: 16.h),
        UserInfoWidget(),
        SizedBox(height: 16.h),
        CustomButtonWidget(
          onTap: () {
            context.read<VacationCubit>().changeTab(2);

            BlocProvider.of<VacationTabCubit>(context).changeTab(0);
          },
          title: "قدم الطلب",
        ),
        SizedBox(height: 30.h),
      ],
    );
  }
}
