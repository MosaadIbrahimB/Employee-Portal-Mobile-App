
import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/home/data/report_model.dart';

class NumberOfRequestAdvanceAndSickLeave extends StatelessWidget {
  const NumberOfRequestAdvanceAndSickLeave({super.key, required this.reportModel});
  final ReportModel reportModel;

  @override
  Widget build(BuildContext context) {
    return Container  (
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 8).r,
      decoration: BoxDecoration(
          color:reportModel.isSickLeave==true? Color(0xffEDF5FF):null,
          borderRadius: BorderRadius.circular(8).r
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              reportModel. isRequestAdvance == true
                  ? SvgPicture.asset(
                "assets/image/home/money-bills.svg",
              )
                  : SizedBox(),

              reportModel. isSickLeave == true
                  ? SvgPicture.asset(
                "assets/image/home/withdrawals_icon.svg",
              )
                  : SizedBox(),
              SizedBox(width: 5.w),
              reportModel. isRequestAdvance == true?
              Text(" عدد الاقساط :${reportModel.numberOfInstallments}", style: AppTextStyle.nun14w400):SizedBox(),
              reportModel. isSickLeave == true?
              Text("مسحوبات الرصيد | ${reportModel.numberOfInstallments}", style: AppTextStyle.nun14w400):SizedBox(),
              SizedBox(width: 32.w),
              reportModel.isRequestAdvance == true?
              SvgPicture.asset("assets/image/home/money-bill.svg"):SizedBox(),
              SizedBox(width: 5.w),
              reportModel.isRequestAdvance == true?
              Text("${reportModel.amount}\$", style: AppTextStyle.nun14w400):SizedBox(),
              reportModel. isSickLeave == true?
              SvgPicture.asset("assets/image/home/wave_icon.svg"):SizedBox(),
              SizedBox(width: 5.w),
              reportModel.isSickLeave == true?
              Text("الرصيد المتاح| ${reportModel.amount}", style: AppTextStyle.nun14w400):SizedBox(),
            ],

          ),
        ],
      ),
    );
  }
}
