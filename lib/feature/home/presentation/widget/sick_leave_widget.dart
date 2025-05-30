import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/home/data/report_model.dart';
import 'package:employee_portal_mobile_app/feature/home/presentation/widget/text_widget.dart';

class SickLeaveWidget extends StatelessWidget {
  final ReportModel reportModel;

  const SickLeaveWidget({super.key, required this.reportModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset("assets/image/home/withdrawals_icon.svg"),
        SizedBox(width: 5.w),
        TextWidget(
          title: "مسحوبات الرصيد | ${reportModel.numberOfInstallments}",
        ),
        SizedBox(width: 32.w),
        SvgPicture.asset("assets/image/home/wave_icon.svg"),
        SizedBox(width: 5.w),
        TextWidget(title: "الرصيد المتاح| ${reportModel.amount}"),
      ],
    );
  }
}
