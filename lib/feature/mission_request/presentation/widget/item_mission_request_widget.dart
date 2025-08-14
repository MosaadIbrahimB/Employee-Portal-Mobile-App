import 'package:employee_portal_mobile_app/feature/financial_request/data/model/response_financial_model.dart';
import 'package:employee_portal_mobile_app/feature/layout/export_layout_file.dart';
import '../../../request/presentation/control/tab_switcher/tab_switcher_cubit.dart';
import '../../data/model/response_mission_model.dart';

class ItemMissionRequestWidget extends StatelessWidget {
  const ItemMissionRequestWidget({super.key, required this.model});

  final ResponseMissionModel model;

  @override
  Widget build(BuildContext context) {
    var themeText = Theme.of(context).textTheme;
    var themeColor = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () {
        context.read<TabSwitcherCubit>().changeTab(3);
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
                  decoration: BoxDecoration(color: themeColor.onSecondary),
                  child: Text(
                    model.status ?? "الحالة",
                    style: themeText.labelMedium,
                  ),
                ),
                SizedBox(width: 3.w),
                Text(
                  model.destination ?? "requestTypeName",
                  style: themeText.displaySmall,
                ),
                Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.calendar_today_outlined, size: 15,color: AppColor.midnightBlue,),
                    SizedBox(width: 8.w),
                    Text(
                      model.duration != null
                          ? model.duration!
                          : "duration",

                      style:
                      AppTextStyle.iBMP12w500MidnightBlue, // Color(0xff3D4966)
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8.h),

            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8).r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12).r,
                      border: Border.all(color: AppColor.black12, width: 1.w),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("من",
                            style: AppTextStyle.iBMP18w400), // Color(0xff3D4966)),
                        SizedBox(height: 8.h),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.calendar_today_outlined, size: 16.r),
                            SizedBox(width: 8.w),
                            Text(
                              model.from != null
                                  ? model.from!.substring(0, 10)
                                  : "تاريخ تقديم الطلب  :غير متاح",

                              style:
                                  AppTextStyle.iBMP18w400, // Color(0xff3D4966)
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Icon(Icons.access_time_outlined, size: 15,color: AppColor.midnightBlue,),
                            SizedBox(width: 8.w),
                            Text("9:00 صباحاً",
                                style: AppTextStyle.iBMP18w400),
                          ],
                        ), // Color(0xff3D4966)),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 5.w,),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8).r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12).r,
                      border: Border.all(color: AppColor.black12, width: 1.w),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("الى",
                            style: AppTextStyle.iBMP18w400), // Color(0xff3D4966)),
                        SizedBox(height: 8.h),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.calendar_today_outlined, size: 16.r),
                            SizedBox(width: 8.w),
                            Text(
                              model.to != null
                                  ? model.to!.substring(0, 10)
                                  : "تاريخ تقديم الطلب  :غير متاح",

                              style:
                                  AppTextStyle.iBMP18w400, // Color(0xff3D4966)
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Icon(Icons.access_time_outlined, size: 15,color: AppColor.midnightBlue,),
                            SizedBox(width: 8.w),
                            Text("9:00 صباحاً",
                                style: AppTextStyle.iBMP18w400),
                          ],
                        ), // Color(0xff3D4966)),
                      ],
                    ),
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
