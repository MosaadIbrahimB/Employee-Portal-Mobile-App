import 'package:flutter/material.dart';

import '../../../mission_request/presentation/widget/from_to_mission_widget.dart';
import '../../../request/presentation/control/tab_switcher/tab_switcher_cubit.dart';
import '../../data/model/response_permission_request_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/configure/extension/app_context_extension_theme.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_text_style.dart';

class ItemPermissionRequestWidget extends StatelessWidget {
  const ItemPermissionRequestWidget({super.key, required this.model});

  final ResponsePermissionRequestModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<TabSwitcherCubit>().changeTab(2);
        context.read<TabSwitcherCubit>().setModel(model);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(12).r,
        margin: EdgeInsets.only(bottom: 12).r,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(12).r,
          border: Border.all(color: AppColor.black12, width: 1.w),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.5, vertical: 3).r,
                  decoration: BoxDecoration(color: context.color.onSecondary),
                  child: Text(
                    model.status ?? "الحالة",
                    style: context.text.labelMedium,
                  ),
                ),
                SizedBox(width: 3.w),
                Text(
                  model.permissionTypeName ?? "PermissionTypeName",
                  style: context.text.displaySmall,
                ),
                Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 15,
                      color: AppColor.midnightBlue,
                    ),
                    SizedBox(width: 8.w),
                    model.duration != null
                        ? Text(
                      model.duration!.toString(),
                      style: AppTextStyle.iBMP12w500MidnightBlue,
                    )
                        : Text(
                      "duration",

                      style:
                      AppTextStyle
                          .iBMP12w500MidnightBlue, // Color(0xff3D4966)
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Expanded(
                  child: FromToMissionWidget(
                    title: "من",
                    date: model.from,
                    time: model.from?.substring(11)??"9:00 صباحاً",
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: FromToMissionWidget(
                    title: "إلى",
                    date: model.to,
                    time: model.to?.substring(11)??"9:00 صباحاً",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
