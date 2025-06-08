import 'package:employee_portal_mobile_app/feature/layout/export_Layout_file.dart';
import 'package:employee_portal_mobile_app/feature/splash/presentation/widget/custom_button_widget.dart';
import '../vacation_request_helper/vacation_request_helper.dart';

class ButtonPostVacationWidget extends StatelessWidget {
  const ButtonPostVacationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButtonWidget(
      onTap: () {
        postFunction(context);
      },
      title: "قدم الطلب",
    );
  }

  void postFunction(BuildContext context) {
    VacationRequestHelper.submitVacationRequest(context);
  }
}
