import 'package:employee_portal_mobile_app/core/configure/extension/app_context_extension_theme.dart';
import 'package:employee_portal_mobile_app/feature/loan/presentation/control/get_loan_type/get_loan_type_cubit.dart';
import 'package:employee_portal_mobile_app/feature/loan/presentation/control/get_loan_type/get_loan_type_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/model/loan_type_model.dart';
class LoanTypeRequestDropdownWidget extends StatelessWidget {
  const LoanTypeRequestDropdownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("نوع السلفة ", style: context.text.bodyMedium),
        SizedBox(height: 8.h),
        Container(
          height: 50.h,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12).r,
            border: Border.all(color: context.color.outline, width: 1.0),
          ),
          child: BlocBuilder<GetLoanTypeCubit, GetLoanTypeState>(
            builder: (context, state) {
              if (state.isLoading==true) {
                return Center(
                  child: const Text('جارى التحميل ...'),
                );
              }
              if (state.errorMessage != null) {
                return Text(state.errorMessage!);
              }

              return DropdownButton<LoanTypeModel>(
                underline: const SizedBox(),
                hint: const Text('اختر نوع السلفة'),
                value: state.selectedRequestType,
                isExpanded: true,
                items: state.response?.map((request) {
                  return DropdownMenuItem<LoanTypeModel>(
                    value: request,
                    child: Text(request.name ?? "NAME NOT FOUND"),
                  );
                }).toList(),
                onChanged: (value) {

                  if (value != null||value?.id!=null) {
                    context.read<GetLoanTypeCubit>().selectedRequestType(value!);
                  }
                },
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
              );
            },
          ),
        ),
      ],
    );
  }
}
