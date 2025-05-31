import 'package:employee_portal_mobile_app/core/configure/extension/app_context_extension_theme.dart';
import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/salary/presentation/data/earning_or_deductions_model.dart';

class EarningOrDeductionsWidget extends StatelessWidget {
  const EarningOrDeductionsWidget({super.key,  this.earningOrDeductionsModel,
  });
  final EarningOrDeductionsModel ?earningOrDeductionsModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12).r,
      decoration: BoxDecoration(
          border: Border.all(color:context.color.outline)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(earningOrDeductionsModel?.label??"lable",
            textAlign: TextAlign.right,
            style:context.text.bodyMedium,// AppTextStyle.iBMP14w500
          ),
          Text( earningOrDeductionsModel?.value??"",
            style: context.text.titleMedium ,//AppTextStyle.iBMP16w500
          ),
        ],
      ),
    );
  }
}
