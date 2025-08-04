import 'package:employee_portal_mobile_app/feature/layout/export_layout_file.dart';

import '../request/data/model/response_admin_financial_model.dart';
import '../request/presentation/control/tab_switcher/tab_switcher_cubit.dart';

class ItemRequestWidget extends StatelessWidget {
  const ItemRequestWidget({super.key, required this.model});

  final ResponseAdminFinancialModel model;

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
                  model.requestTypeName ?? "requestTypeName",
                  style: themeText.displaySmall,
                ),
              ],
            ),
            SizedBox(height: 8.h),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.calendar_today_outlined, size: 15),
                SizedBox(width: 8.w),
                Text(
                  model.date != null
                      ? "تاريخ تقديم الطلب  :${model.date!.substring(0, 10)}"
                      : "تاريخ تقديم الطلب  :غير متاح",

                  style:
                      AppTextStyle.iBMP12w500MidnightBlue, // Color(0xff3D4966)
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
