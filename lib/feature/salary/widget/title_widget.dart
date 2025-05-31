import 'package:employee_portal_mobile_app/core/configure/extension/app_context_extension_theme.dart';
import 'package:employee_portal_mobile_app/core/utils/import_file.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.backGroundWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10).r,
          topRight: Radius.circular(10).r,
        ),
        border: Border(
          top: BorderSide(color: context.color.outline),
          right: BorderSide(color: context.color.outline),
          left: BorderSide(color: context.color.outline),


        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24).r,
      child: Text(
        title ?? "title",
        style: context.text.headlineMedium!.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
