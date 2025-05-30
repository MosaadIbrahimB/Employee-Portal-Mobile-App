import 'package:employee_portal_mobile_app/core/configure/extension/app_context_extension_theme.dart';
import 'package:employee_portal_mobile_app/core/utils/import_file.dart';

class HeaderReportWidget extends StatelessWidget {
  const HeaderReportWidget({super.key, required this.typeReport, this.widget});

  final String? typeReport;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 21.0).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset("assets/image/home/report_icon.svg"),
              SizedBox(width: 8.h),
              Text(
                typeReport ?? "",
                style: context.text.headlineSmall!.copyWith(
                  color: context.color.primaryFixedDim,
                ),
              ),
            ],
          ),
          widget != null ? Icon(Icons.arrow_forward_outlined) : SizedBox(),
        ],
      ),
    );
  }
}
