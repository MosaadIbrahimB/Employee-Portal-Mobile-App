import 'package:employee_portal_mobile_app/core/configure/extension/app_context_extension_theme.dart';
import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/salary/presentation/data/earning_or_deductions_model.dart';
import 'package:employee_portal_mobile_app/feature/salary/widget/list_earning_or_deductions_widget.dart';

class DetailSalaryBodyWidget extends StatelessWidget {
  const DetailSalaryBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Center(
            child: Container(
              alignment: AlignmentDirectional.centerEnd,
              width: double.infinity,
              padding: EdgeInsets.all(12).r,
              decoration: BoxDecoration(
                color: context.color.outline, // Color(0xffE6E6E6)
                borderRadius: BorderRadius.circular(10).r,
              ),
              child: RichText(
                text: TextSpan(
                  text: 'Net salary: ',
                  style: context.text.headlineMedium,
                  children: [
                    TextSpan(
                      text: '13850 L.E',
                      style: context.text.headlineMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          ListEarningOrDeductionsWidget(
            list: EarningOrDeductionsModel.earnings,
            title: "الاستحقاقات",
            isEarnings: true,
            total: "15000",
          ),
          SizedBox(height: 16.h),
          ListEarningOrDeductionsWidget(
            list: EarningOrDeductionsModel.deductions,
            title: "الاستقطاعات",
            isEarnings: false,
            total: "1150",
          ),
        ],
      ),
    );
  }
}
