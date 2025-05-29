import 'package:employee_portal_mobile_app/feature/home/control/home_cubit.dart';
import 'package:employee_portal_mobile_app/feature/layout/export_Layout_file.dart';

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
            Text("الرئيسية", style: AppTextStyle.iBMP24w600),
             Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(" اهلاً بك", style: AppTextStyle.iBMP12w500),
                Text(",", style: AppTextStyle.iBMP12w500),
                Text(title, style: AppTextStyle.iBMP12w500.copyWith(
                    color: Color(0xff0958D9)
                )),
              ],
            )
          ],
        ),
        GestureDetector(
          onTap: (){
            context.read<HomeCubit>().changeScreen(1);
          },
          child: Container(
            width: 44.w,
            height: 44.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15).r,
              color: Theme.of(context).colorScheme.onSurface,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 4), // changes position of shadow
                ),
              ],
            ),
            child: Icon(Icons.notifications_none, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
