import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import '../../request/data/model/response_admin_financial_model.dart';

class ReviewerWidget extends StatelessWidget {
  const ReviewerWidget({super.key, required this.reviewer});

  final Reviewers reviewer;

  @override
  Widget build(BuildContext context) {
    var colorTheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 5).r,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "المراجع " ?? "المراجع ",
                  style: textTheme.bodyMedium,
                ),

                // AccountStatusWidget(accountModel: accountModel),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.5, vertical: 3).r,
                  decoration: BoxDecoration(
                    color: context.color.secondary,
                  ),
                  child: Text(reviewer.status.toString()??"الحالة", style: context.text.labelMedium?.copyWith(
                    fontWeight: FontWeight.bold
                  )),
                )
              ],
            ),
            SizedBox(height: 8.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12).r,
              decoration: BoxDecoration(
                border: Border.all(color: colorTheme.outline),
                borderRadius: BorderRadius.circular(8).r,
                color: colorTheme.onPrimaryContainer,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    reviewer.name ?? " محمد طارق",
                    style: textTheme.bodyLarge,
                  ), // InputDataWidget(
                  Text(
                    reviewer.note ?? "123456",
                    style: textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
