import '../../../../../core/utils/import_file.dart';
import '../../../../request/presentation/control/tab_switcher/tab_switcher_cubit.dart';
import '../../../data/model/alert_model.dart';
import '../../control/get_alerts_over_time/get_alerts_over_time_cubit.dart';
import 'convert_hijri_to_gregorian.dart';

class ItemOfListOverTimeWidget extends StatelessWidget {
  const ItemOfListOverTimeWidget({super.key, required this.model,required this.isSelected});

  final AlertModel model;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<TabSwitcherCubit>().changeTab(4);
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
                Text(
                  model.alertType ?? "requestTypeName",
                  style: context.text.displaySmall,
                ),
                Spacer(),
                Checkbox(
                  materialTapTargetSize:MaterialTapTargetSize.shrinkWrap ,
                  value:isSelected,
                  onChanged: (value){
                    context.read<GetAlertsOverTimeCubit>().toggleAlertSelection(
                      model,
                      value ?? false,
                    );

                  },
                )

              ],
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.calendar_today_outlined, size: 16.r),
                    SizedBox(width: 8.w),
                    Text(
                      hijriToGregorian()??"تاريخ تقديم الطلب  :غير متاح",

                      style: context.text.titleSmall, // Color(0xff3D4966)
                    ),
                  ],
                ),
                Spacer(),

                Row(
                  children: [
                    Icon(
                      Icons.access_time_outlined,
                      size: 15,
                      color: AppColor.midnightBlue,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      model.duration != null
                          ? model.duration.toString()!
                          : "duration",

                      style:
                      AppTextStyle.iBMP12w500MidnightBlue, // Color(0xff3D4966)
                    ),
                  ],
                ),


              ],
            ),
          ],
        ),
      ),
    );
  }
String  hijriToGregorian(){
    String hijriDateString = model.date ?? "";
   return convertHijriToGregorian(hijriDateString);
  }
}
