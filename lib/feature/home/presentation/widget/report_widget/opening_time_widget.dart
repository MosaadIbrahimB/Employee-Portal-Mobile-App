import 'package:employee_portal_mobile_app/core/utils/import_file.dart';

class OpeningTimeWidget extends StatelessWidget {
  const OpeningTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset("assets/image/home/opening-times.svg"),
        SizedBox(width: 3.w),
        Text(
          "20 مايو 2024",
          style: AppTextStyle.iBMP12w500.copyWith(color: Color(0xff3D4966)),
        ),
      ],
    );
  }
}
