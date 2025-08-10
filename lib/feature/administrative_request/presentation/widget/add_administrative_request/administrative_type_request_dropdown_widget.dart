import 'package:employee_portal_mobile_app/core/configure/extension/app_context_extension_theme.dart';
import 'package:employee_portal_mobile_app/feature/administrative_request/data/model/administrative_request_type_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../vacation/presentation/control/default_reviewer/default_reviewer_cubit.dart';
import '../../control/administrative_request_type/get_administrative_request_type_cubit.dart';
import '../../control/administrative_request_type/get_administrative_request_type_state.dart';
class AdministrativeTypeRequestDropdownWidget extends StatelessWidget {
  const AdministrativeTypeRequestDropdownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("نوع الطلب ", style: context.text.bodyMedium),
        SizedBox(height: 8.h),
        Container(
          height: 50.h,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12).r,
            border: Border.all(color: context.color.outline, width: 1.0),
          ),
          child: BlocBuilder<GetAdministrativeRequestTypeCubit, GetAdministrativeRequestTypeState>(
            builder: (context, state) {
              if (state.isLoading==true) {
                return Center(
                  child: const Text('جارى التحميل ...'),
                );
              } else if (state.errorMessage != null) {
                return Text(state.errorMessage!);
              }

              return DropdownButton<AdministrativeRequestTypeModel>(
                underline: const SizedBox(),
                hint: const Text('اختر نوع الطلب'),
                value: state.selectedRequestType,
                isExpanded: true,
                items:
                state.response?.map((request) {
                  return DropdownMenuItem<AdministrativeRequestTypeModel>(
                    value: request,
                    child: Text(request.name ?? "NAME NOT FOUND"),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    context.read<GetAdministrativeRequestTypeCubit>().selectedRequestType(value);
                    context.read<DefaultReviewerCubit>().fetchDefaultReviewers();
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
