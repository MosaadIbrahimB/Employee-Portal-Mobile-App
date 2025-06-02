import 'package:employee_portal_mobile_app/core/utils/import_file.dart';

class OpeningTimeWidget extends StatelessWidget {
  const OpeningTimeWidget({super.key, this.title, this.color});
final String ? title ;
final Color? color ;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset("assets/image/home/opening-times.svg",color:color,),
        SizedBox(width: 3.w),
        Text(title??"20 مايو 2024", style: context.text.bodySmall),
      ],
    );
  }
}
