import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:employee_portal_mobile_app/core/configure/extension/app_context_extension_theme.dart';
import 'package:employee_portal_mobile_app/feature/layout/export_layout_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/model/financial_request_type_model.dart';
import '../control/request/request_cubit.dart';

class CustomDropdownButton extends StatelessWidget {
  CustomDropdownButton({super.key});
  final  List<FinancialRequestTypeModel>listStatic=[
    FinancialRequestTypeModel(name: "طلب اداري"),
    FinancialRequestTypeModel(name: "طلب اذن"),
    FinancialRequestTypeModel(name: "طلب اضافي"),
    FinancialRequestTypeModel(name: "ساعات عمل شهري"),
    FinancialRequestTypeModel(name: "طلب سلفة"),
    FinancialRequestTypeModel(name: "طلب مالي"),
    FinancialRequestTypeModel(name: "طلب مأمورية"),
  ];

  @override
  Widget build(BuildContext context) {
    return  DropdownButtonHideUnderline(
      child: DropdownButton2<FinancialRequestTypeModel>(
        isExpanded: true,
        // value: value,
        hint: Text(
          'طلب جديد',
          style: context.text.bodyLarge!.copyWith(
            color: context.color.surface,
          ),
        ),

        items:
        listStatic.map((request) {
          return DropdownMenuItem<
              FinancialRequestTypeModel
          >(
            value: request,
            child: Text(request.name ?? " لا يوجد نوع طلبات للمستخدم"),

          );
        }).toList(),
        onChanged: (value) {
          if (value != null) {
            final index = listStatic.indexWhere((element) => element.name == value.name)+1;
           context.read<RequestCubit>().changePage(index);          }
        },
        buttonStyleData: ButtonStyleData(
          height: 50.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12).r,
            color: context.color.primary,
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
        ),
        iconStyleData: IconStyleData(
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: context.color.surface,
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12).r,
          ),
        ),
      ),
    );
  }
}
