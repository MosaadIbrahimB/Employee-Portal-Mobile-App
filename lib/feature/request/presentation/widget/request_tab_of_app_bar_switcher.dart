import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../control/tab_switcher/tab_switcher_cubit.dart';

class RequestTabOfAppBarSwitcher extends StatelessWidget {
  const RequestTabOfAppBarSwitcher({super.key,  required this.tabs});

  final  List<String> tabs ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 208.w,
      height: 40.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8).r,
        color: Color(0xffF2F5F9),
      ),
      child: BlocBuilder<TabSwitcherCubit, int>(
        builder: (context, state) {

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(tabs.length, (index) {
              bool isSelected = index == state;
              return GestureDetector(
                onTap: () {
                  BlocProvider.of<TabSwitcherCubit>(context).changeTab(index);
                },
                child: Container(
                  height: 32.h,
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                    color: isSelected ?AppColor.primary : null,
                    borderRadius: BorderRadius.circular(8).r,
                  ),
                  child: Center(
                    child: Text(
                      tabs[index],
                      style: AppTextStyle.iBMP12w500MidnightBlue.copyWith(
                        color:
                            isSelected
                                ? context.color.surface
                                : context.color.onSurface,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700

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
