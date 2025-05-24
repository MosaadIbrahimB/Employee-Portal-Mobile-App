import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/salary/presentation/data/earning_or_deductions_model.dart';
import 'package:employee_portal_mobile_app/feature/salary/widget/earning_or_deductions_widget.dart';
import 'package:employee_portal_mobile_app/feature/salary/widget/title_widget.dart' show TitleWidget;
import 'package:employee_portal_mobile_app/feature/salary/widget/total_widget.dart' show TotalWidget;

class ListEarningOrDeductionsWidget extends StatelessWidget {
  const ListEarningOrDeductionsWidget({super.key, required this.list, this.title, this.total, this.isEarnings});
  final List<EarningOrDeductionsModel>list;
  final String?title;
  final String?total;
  final bool?isEarnings;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleWidget(title: "الاستحقاقات",),
        Column(
          children: list.map((e) => EarningOrDeductionsWidget(
            earningOrDeductionsModel:e ,
          ),).toList(),
        ),
        TotalWidget(title: title,total:total ,isEarnings: isEarnings,),
        SizedBox(height: 16),
      ],
    );
  }
}
