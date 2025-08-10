import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/home/data/report_model.dart';

class NotsDetailsWidget extends StatelessWidget {
  const NotsDetailsWidget({super.key, required this.nots});
  final String? nots;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('ملاحظات اضافية', style: AppTextStyle.iBMP14w500),
        SizedBox(height: 8.h),
        Container(
          height: 79.h,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8).r,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            borderRadius: BorderRadius.circular(12).r,
            border: Border.all(color: Theme.of(context).colorScheme.outline),
          ),
          child: Text(nots??'نص الملاحظات'),
        ),
      ],
    );
  }
}
