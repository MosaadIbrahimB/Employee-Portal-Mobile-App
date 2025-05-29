import 'package:employee_portal_mobile_app/core/utils/import_file.dart';

class AppBarManagementRequestWidget extends StatelessWidget {
  const AppBarManagementRequestWidget({
    super.key,
    required this.title,
    this.onTap,
  });

  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap:onTap,
          child: Container(
            padding: EdgeInsets.all(8).r,
            color: Color(0xffF2F5F9),
            child: Icon(Icons.close),
          ),
        ),
        SizedBox(width: 12.w),
        Text(title, style: Theme.of(context).textTheme.headlineLarge),
      ],
    );
  }
}
