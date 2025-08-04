import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/home/data/report_model.dart';

class SubmissionDateWidget extends StatelessWidget {
  const SubmissionDateWidget({super.key, required this.dateRequest});

  final String dateRequest;

  @override
  Widget build(BuildContext context) {
    // var colorTheme = Theme.of(context).colorScheme;
    // var textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("تاريخ تقديم الطلب", style: Theme.of(context).textTheme.bodyMedium),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12).r,
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.outline),
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          child: Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
                color: context.color.surfaceContainer,
                size: 22.r,
              ),
              SizedBox(width: 8.w),
              Text(dateRequest, style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        ),
      ],
    );
  }
}
