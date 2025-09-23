import 'package:employee_portal_mobile_app/feature/loan/presentation/widget/total_money_widget.dart';

import '../../../../core/utils/import_file.dart';
import '../../../request/presentation/control/tab_switcher/tab_switcher_cubit.dart';
import '../../data/model/response_loan_model.dart';
import 'amount_widget.dart';
import 'from_and_to_loan_date_widget.dart';

class ItemLoanRequestWidget extends StatelessWidget {
  const ItemLoanRequestWidget({super.key, required this.model});

  final LoanModel model;

  @override
  Widget build(BuildContext context) {
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
                  decoration: BoxDecoration(color: context.color.onSecondary),
                  child: Text(
                    model.status ?? "الحالة",
                    style: context.text.labelMedium,
                  ),
                ),
                SizedBox(width: 3.w),
                Text(
                  model.loanTypeName ?? "loanTypeName",
                  style: context.text.displaySmall,
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.calendar_today_outlined, size: 15,color: AppColor.midnightBlue,),
                SizedBox(width: 8.w),

                Text("تاريخ السلفة  : ${ model.date != null
                    ? model.date!.substring(0, 10)
                    : "date"}",

                  style:
                  AppTextStyle.iBMP12w500MidnightBlue, // Color(0xff3D4966)
                ),
              ],
            ),
            SizedBox(height: 8.h),
            AmountWidget(title: model.value.toString() ),
            SizedBox(height: 8.h),
            Row(
              children: [

                Expanded(
                  child: FromAndToLoanDateWidget(
                    title: "من",
                    date: model.startDate.toString()??"0",
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: FromAndToLoanDateWidget(
                    title: "إلى",
                    date: model.lastDate.toString()??"0",
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
