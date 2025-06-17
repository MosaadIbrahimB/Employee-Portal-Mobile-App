import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/widget/no_vacation_widget/text_no_vacation_widget.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/widget/no_vacation_widget/vacation_year_current_widget.dart';

class NoVacationWidget extends StatelessWidget {
  const NoVacationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("الاجازات", style: context.text.displayMedium),
        SizedBox(height: 20.h),
        // VacationYearCurrentWidget(),
        SizedBox(height: 36.h),
        const TextNoVacationWidget(),

      ],
    );
  }
}
