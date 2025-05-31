import 'package:employee_portal_mobile_app/core/component/header_core_widget.dart' show HeaderCoreWidget;
import 'package:employee_portal_mobile_app/core/configure/extension/app_context_extension_theme.dart';
import 'package:employee_portal_mobile_app/core/utils/import_file.dart';

class HeaderRequestScreenWidget extends StatelessWidget {
  const HeaderRequestScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 10).r,
      decoration: BoxDecoration(
        border: Border.all(color:context.color.outline),
        borderRadius: BorderRadius.circular(8).r,
        color: context.color.surface,
      ),
      child: HeaderCoreWidget(
        title: "قائمة الطلبات",
        subTitle: "حالة الطلبات | الكل",
      ),
    );
  }
}
