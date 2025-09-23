import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/home/data/report_model.dart';



class TypeWidget extends StatelessWidget {
  const TypeWidget({super.key, required this.requestTypeName, this.installments});
  final String? requestTypeName;
  final String? installments;

  @override
  Widget build(BuildContext context) {
    var colorTheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(   "النوع", style: textTheme.bodyMedium),
            Spacer(),
            Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8).r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6).r,
                  border: Border.all(color: colorTheme.outline),

                  color: colorTheme.onPrimaryContainer,
                ),child: Text(   "عدد الاقساط : $installments أقساط", style: textTheme.bodyMedium)),

          ],
        ),
        SizedBox(height: 8.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: colorTheme.outline),
            borderRadius: BorderRadius.circular(8).r,
            color: colorTheme.onPrimaryContainer,
          ),
          child: Text(
            " ${requestTypeName ?? "النوع"}",
            style: textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}


