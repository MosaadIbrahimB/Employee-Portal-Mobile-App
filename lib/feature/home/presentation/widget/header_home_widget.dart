import 'package:employee_portal_mobile_app/core/configure/extension/app_context_extension_theme.dart';
import 'package:employee_portal_mobile_app/feature/home/control/home_cubit.dart';
import 'package:employee_portal_mobile_app/feature/layout/export_layout_file.dart';


class HeaderHomeWidget extends StatelessWidget {
  const HeaderHomeWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("الرئيسية", style:  context.text.displayMedium ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(" اهلاً بك", style:context.text.bodySmall),
                Text(",", style: context.text.bodySmall),
                Text(
                  title,
                  style: context.text.bodySmall!.copyWith(
                    color: context.color.primaryContainer,
                  ),
                ),
              ],
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            context.read<HomeCubit>().changeScreen(1);
          },
          child: Container(
            width: 44.w,
            height: 44.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15).r,
              color: context.color.primaryFixed,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 4), // changes position of shadow
                ),
              ],
            ),
            child: Icon(
              Icons.notifications_none,
              color: context.color.surface,
              size: 24.sp,
            ),
          ),
        ),
      ],
    );
  }
}

