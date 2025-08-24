import 'package:employee_portal_mobile_app/core/configure/extension/app_context_extension_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/model/get_allowed_permission_model.dart';
import '../../control/get_allowed_permission/get_allowed_permission_cubit.dart';
import '../../control/get_allowed_permission/get_allowed_permission_state.dart';
class AllowedPerMissionDropdownWidget extends StatelessWidget {
  const AllowedPerMissionDropdownWidget({super.key});

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
          child: BlocBuilder<GetAllowedPerMissionRequestCubit, GetAllowedPerMissionRequestState>(
            builder: (context, state) {
              if (state.isLoading==true) {
                return Center(
                  child: const Text('جارى التحميل ...'),
                );
              }
              if (state.errorMessage != null) {
                return Text(state.errorMessage!);
              }

              return DropdownButton<GetAllowedPermissionModel>(
                underline: const SizedBox(),
                hint: const Text('اختر نوع الاذن'),
                value: state.selectedRequestType,
                isExpanded: true,
                items: state.response?.map((request) {
                  return DropdownMenuItem<GetAllowedPermissionModel>(
                    value: request,
                    child: Text(request.text ?? "NAME NOT FOUND"),
                  );
                }).toList(),
                onChanged: (value) {

                  if (value != null||value?.id!=null) {
                    context.read<GetAllowedPerMissionRequestCubit>().selectedRequestType(value!);
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
