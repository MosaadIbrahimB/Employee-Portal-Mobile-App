import 'package:easy_localization/easy_localization.dart';
import 'package:employee_portal_mobile_app/core/component/input_data_widget.dart';
import 'package:employee_portal_mobile_app/core/service/dependency_injection/package_export.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/add_request/add_document_button_widget.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/add_request/list_reviewer_widget.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/notes_input_field.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/request_type/management_request/app_bar_management_request_widget.dart';
import 'package:employee_portal_mobile_app/feature/splash/presentation/widget/custom_button_widget.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/validate_vacation/validate_vacation_request_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/calculate_vacation_duration/calculate_vacation_duration_cubit.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/date_cubit/date_cubit.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/vacation_cubit/vacation_cubit.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/vacation_type/vacation_type_state.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/validate_vacation/validate_vacation_cubit.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/control/validate_vacation/validate_vacation_state.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/widget/vacation_request/from_to_date_widget.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/widget/vacation_request/input_duration_widget.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/widget/vacation_request/reviewer_widget.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/widget/vacation_request/vacation_dropdown_widget.dart';
import 'package:file_picker/file_picker.dart';

import '../../../../layout/export_Layout_file.dart';
import '../../../../person/presentation/widget/tab_info_data/custom_image_pick_widget.dart';
import '../../control/vacation_tab/vacation_tab_cubit.dart';
import 'file_picker_widget.dart';

class VacationRequestWidget extends StatefulWidget {
  const VacationRequestWidget({super.key});

  @override
  State<VacationRequestWidget> createState() => _VacationRequestWidgetState();
}

class _VacationRequestWidgetState extends State<VacationRequestWidget> {
  final TextEditingController employSecondController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ValidateVacationCubit, ValidateVacationState>(
      listener: (context, state) {
        if (state is ValidateVacationLoading) {
          Center(child: CircularProgressIndicator());
        }

        if (state is ValidateVacationSucceed &&
            state.response.isValid == false) {
          context.showErrorDialog(state.response.message!.tr());
        }

        if (state is ValidateVacationError) {
          context.showSuccessDialog(state.message.tr());
        }

        if (state is ValidateVacationSucceed &&
            state.response.isValid == true) {
          // context.showSuccessDialog(state.response.message!.tr());
          // context.read<VacationCubit>().changeTab(2);
          // BlocProvider.of<VacationTabCubit>(context).changeTab(0);
          context.showSnackBar("تم تسجيل الطلب", backgroundColor: Colors.black);
        }
      },
      builder: (context, state) {
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
            VacationDropdownWidget(),
            SizedBox(height: 16.h),
            FromToDateWidget(),
            SizedBox(height: 16.h),
            //duration
            DurationWidget(),
            SizedBox(height: 16.h),
            InputDataWidget(
              title: "الموظف البديل",
              hint: "مهدى غانم",
              controller: employSecondController,
            ),
            SizedBox(height: 16.h),
            NotesInputField(
              controller: context.read<PostVacationCubit>().noteInputController,
            ),
            SizedBox(height: 16.h),

            // Add document button
            BlocBuilder<VacationTypeCubit, VacationTypeState>(
              builder: (context, state) {
                if (state.selectedVacation?.requiredAttachment == true) {
                  return FilePickerWidget();
                }
                return SizedBox();
              },
            ),
            ReviewerWidget(),
            SizedBox(height: 16.h),
            ListReviewerWidget(),
            SizedBox(height: 16.h),
            CustomButtonWidget(
              onTap: () {
                postFunction(context);
              },
              title: "قدم الطلب",
            ),
            SizedBox(height: 30.h),
          ],
        );
      },
    );
  }

  postFunction(BuildContext context) {
    ValidateVacationRequestModel model = ValidateVacationRequestModel(
      fromDate: context.read<DateCubit>().state.fromDate,
      toDate: context.read<DateCubit>().state.toDate,
      duration:
          context.read<CalculateVacationDurationCubit>().state.response!.count!,
      vacationTypeId:
          context.read<VacationTypeCubit>().state.selectedVacation?.id ?? 0,
      id: 0,
    );
    context.read<ValidateVacationCubit>().validate(model);
  }
}
