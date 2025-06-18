import 'package:employee_portal_mobile_app/core/component/custom_status_widget.dart';
import 'package:employee_portal_mobile_app/core/model/status_model.dart';
import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/home/presentation/widget/report_widget/number_of_request_advance_and_sick_leave.dart';
import 'package:employee_portal_mobile_app/feature/home/presentation/widget/report_widget/opening_time_widget.dart';
import 'package:employee_portal_mobile_app/feature/home/presentation/widget/text_widget.dart';
import 'package:employee_portal_mobile_app/feature/vacation/data/model/get_employee_vacations_model/get_employee_vacations_model.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/widget/vacation/item_of_from_to_widget.dart';

import '../../../../data/model/get_employee_vacations_model/get_employee_vacations_response_model.dart';

class ItemTabAllVacationWidget extends StatelessWidget {
  final GetEmployeeVacationsResponseModel employeeVacationsModel;

  const ItemTabAllVacationWidget({
    super.key,
    required this.employeeVacationsModel,
  });

  @override
  Widget build(BuildContext context) {
    String duration = "${employeeVacationsModel.duration ?? "10"}";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 12).r,
          padding: EdgeInsets.all(12).r,
          decoration: BoxDecoration(
            color: context.color.surface,
            borderRadius: BorderRadius.circular(12).r,
            border: Border.all(color: AppColor.black12, width: 1.w),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // معتمده - تحت الطلب -مرفوض - التاريخ
              Row(
                children: [
                  // StatusWidget(
                  //   statusModel: StatusModel.employeeVacationsModel(
                  //     employeeVacationsModel: employeeVacationsModel,
                  //   ),
                  // ),
                  Text(
                    employeeVacationsModel.vacationTypeName ?? "",
                    style: context.text.titleMedium!.copyWith(
                      color: context.color.onSurface,
                    ),
                  ),
                  Spacer(),
                  OpeningTimeWidget(title: "المدة : $duration  أيام"),
                ],
              ),
              SizedBox(height: 12.h),

              //عدد الاقساط -- مسحوبات الرصيد
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 8).r,
                decoration: BoxDecoration(
                  color: context.color.onPrimaryFixed,
                  borderRadius: BorderRadius.circular(8).r,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/image/home/withdrawals_icon.svg"),
                    SizedBox(width: 5.w),
                    TextWidget(
                      title:
                          "مسحوبات الرصيد | ",
                    ),
                    SizedBox(width: 61.w),
                    SvgPicture.asset("assets/image/home/wave_icon.svg"),
                    SizedBox(width: 5.w),
                    TextWidget(
                      title:
                          "الرصيد المتاح| ",
                    ),
                  ],
                ),
              ),

              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ItemOfFromToWidget(
                      title: "من",
                      date: employeeVacationsModel.fromDate!.substring(0,10) ?? "22 نوفمبر 2024",
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: ItemOfFromToWidget(
                      title: "من",
                      date: employeeVacationsModel.toDate!.substring(0,10) ?? "22 نوفمبر 2024",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
