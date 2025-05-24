import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/person/control/tab_person_screen_cubit/tab_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabOfAppBarSwitcher extends StatelessWidget {
   TabOfAppBarSwitcher({super.key});

 final  List<String> tabs = ['بياناتي', 'المهارات', 'الدرجة العلمية'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 208.w,
      height: 40.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius
            .circular(8)
            .r,
        color: Color(0xffF2F5F9),
      ),
      child: BlocBuilder<TabCubit, int>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(tabs.length, (index) {
              bool isSelected = index == state;
              return GestureDetector(
                onTap: () {
                  BlocProvider.of<TabCubit>(context).changeTab(index);
                },
                child: Container(
                  height: 32.h,
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.lightBlue : null,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      tabs[index],
                      style: AppTextStyle.iBMP12w500.copyWith(
                        color: isSelected ? Colors.white : Colors.black,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
