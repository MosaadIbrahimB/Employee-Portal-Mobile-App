import 'package:employee_portal_mobile_app/core/component/custom_decorator_container_widget.dart';
import 'package:employee_portal_mobile_app/core/component/custom_status_widget.dart';
import 'package:employee_portal_mobile_app/core/model/reviewer_model.dart';
import 'package:employee_portal_mobile_app/core/model/status_model.dart';
import 'package:employee_portal_mobile_app/core/utils/import_file.dart';

class CustomReviewerWidget extends StatelessWidget {
  const CustomReviewerWidget({
    super.key,
    required this.reviewerModel,
    required this.statusModel,
  });

  final ReviewerModel reviewerModel;
  final StatusModel statusModel;

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
                Text("المراجع ", style: textTheme.bodyMedium),

                StatusWidget(statusModel: statusModel),
              ],
            ),
            SizedBox(height: 8.h),
            CustomDecoratorContainerWidget(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,

              children: [
                Text(
                  reviewerModel.name ?? " محمد طارق",
                  style: textTheme.bodyLarge,
                ), // InputDataWidget(
                Text(
                  reviewerModel.id ?? "123456",
                  style: textTheme.bodyLarge,
                ),
              ],
            ),)
          ],
        ),
      ),
    );
  }
}

