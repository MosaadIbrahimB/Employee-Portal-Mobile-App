import 'package:employee_portal_mobile_app/core/component/custom_status_widget.dart';
import 'package:employee_portal_mobile_app/core/model/status_model.dart';
import 'package:employee_portal_mobile_app/core/utils/import_file.dart';

class CustomAppBarScreenWidget extends StatelessWidget {
  const CustomAppBarScreenWidget({
    super.key,
    required this.title,
    this.onTap,
    this.icon,
    required this.statusModel,
    this.isDetailsScreen,
  });

  final String title;
  final void Function()? onTap;
  final IconData? icon;
  final StatusModel statusModel;
  final bool? isDetailsScreen;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(8).r,
            color: Theme.of(context).colorScheme.secondary,
            child: Icon(icon ?? Icons.close),
          ),
        ),
        SizedBox(width: 12.w),
        Text(title, style: Theme.of(context).textTheme.headlineLarge),
        const Spacer(),
        isDetailsScreen == true
            ?

        StatusWidget(
          statusModel: statusModel,
        ):
        SizedBox(),

      ],
    );
  }
}
