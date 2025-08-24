import 'package:employee_portal_mobile_app/feature/layout/export_layout_file.dart';
import '../../../request/presentation/control/tab_switcher/tab_switcher_cubit.dart';
import '../../data/model/response_mission_model.dart';
import 'from_to_mission_widget.dart';

class ItemMissionRequestWidget extends StatelessWidget {
  const ItemMissionRequestWidget({super.key, required this.model});

  final dynamic model;

  @override
  Widget build(BuildContext context) {
    var themeText = Theme.of(context).textTheme;
    var themeColor = Theme.of(context).colorScheme;
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
                  child: FromToMissionWidget(
                    title: "من",
                    date: model.from,
                    time: "9:00 صباحاً",
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: FromToMissionWidget(
                    title: "إلى",
                    date: model.to,
                    time: "9:00 صباحاً",
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
