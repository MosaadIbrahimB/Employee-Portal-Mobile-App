import 'package:employee_portal_mobile_app/core/component/header_core_widget.dart' show HeaderCoreWidget;
import 'package:employee_portal_mobile_app/core/utils/import_file.dart';

class HeaderRequestScreenWidget extends StatelessWidget {
  const HeaderRequestScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 10).r,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffE5E5E5)),
        borderRadius: BorderRadius.circular(8).r,
        color: Colors.white,
      ),
      child: HeaderCoreWidget(
        title: "قائمة الطلبات",
        subTitle: "حالة الطلبات | الكل",
      ),
    );
  }
}
