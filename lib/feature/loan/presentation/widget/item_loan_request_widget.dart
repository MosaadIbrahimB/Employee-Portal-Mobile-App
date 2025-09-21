import '../../../../core/utils/import_file.dart';
import '../../../request/presentation/control/tab_switcher/tab_switcher_cubit.dart';
import 'from_and_to_loan_date_widget.dart';
/*
 {
        "Value": 12000.0,
        "Date": "2025-09-09T00:00:00",
        "LoanTypeName": "Loan",
        "Installments": 6,
        "StartDate": "2025-09-01T00:00:00",
        "InstallmentValue": 2000.0,
        "LastDate": "2026-02-01T00:00:00",
        "Paid": 0.0,
        "Status": "Accepted"
    }
 */
class ItemLoanRequestWidget extends StatelessWidget {
  const ItemLoanRequestWidget({super.key, required this.model});

  final dynamic model;

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
                  model.destination ?? "requestTypeName",
                  style: context.text.displaySmall,
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
                  child: FromAndToLoanDateWidget(
                    title: "من",
                    date: model.from.toString()??"0",
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: FromAndToLoanDateWidget(
                    title: "إلى",
                    date: model.to.toString()??"0",
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
