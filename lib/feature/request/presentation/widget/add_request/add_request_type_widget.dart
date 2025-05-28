import 'package:employee_portal_mobile_app/feature/request/presentation/widget/request_type/management_request/all_management_request_widget.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/request_type/management_request/management_request_widget.dart';

import '../../../../layout/export_Layout_file.dart';

class AddRequestTypeWidget extends StatelessWidget {
  const AddRequestTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(

child: ManagementRequestWidget(),
      ),
    );
  }
}



