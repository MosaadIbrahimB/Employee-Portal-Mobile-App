import 'package:employee_portal_mobile_app/core/utils/import_file.dart';

class AppBarRequestWidget extends StatelessWidget {
  const AppBarRequestWidget({
    super.key,
    required this.title,
    this.onTap,
    this.icon,
  });

  final String title;
  final void Function()? onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      if(icon !=null)  GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(8).r,
            color: Theme.of(context).colorScheme.secondary,
            child: Icon(icon ?? Icons.close),
          ),
        ),
        if(icon !=null) SizedBox(width: 12.w),
        Text(title, style: Theme.of(context).textTheme.headlineLarge),
      ],
    );
  }
}
