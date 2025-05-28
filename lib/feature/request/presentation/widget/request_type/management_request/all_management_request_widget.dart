import 'package:employee_portal_mobile_app/core/component/input_data_widget.dart';
import 'package:employee_portal_mobile_app/core/component/input_date_day_widget.dart';
import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/request/control/tab_switcher/tab_switcher_cubit.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/widget/request_type/management_request/app_bar_management_request_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllManagementRequestWidget extends StatelessWidget {
  const AllManagementRequestWidget({super.key});

  static final List<Widget> listBody = [
    TabAdministrativeRequestWidget(),
    Text("2"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Column(
      children: [
        SizedBox(height: 12.h),
        AppBarManagementRequestWidget(title: "طلباتى الادارية",),
        SizedBox(height: 10.h),
        TabOfAppBarSwitcher(),
        SizedBox(height: 12.h),
        //body
        Padding(
          padding: const EdgeInsets.all(8.0).r,
          child: BlocBuilder<TabSwitcherCubit, int>(
            builder: (context, state) {
              return listBody[state];
            },
          ),
        ),
        SizedBox(height: 16.h),

      ],
    ));
  }
}

class TabAdministrativeRequestWidget extends StatelessWidget {
  const TabAdministrativeRequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.calendar_today_outlined),
            SizedBox(width: 8.w,),
            Text(
              "نوفمبر 2024",
              style:
              AppTextStyle.iBMP16w500Black
              ,
            ),
            Spacer(),
            Icon(Icons.keyboard_arrow_down_rounded),

          ],
        )
      ],
    );
  }
}








class TabOfAppBarSwitcher extends StatelessWidget {
  TabOfAppBarSwitcher({super.key});

  final List<String> tabs = ['طلب ادارى', 'الاعتمادات الادارية'];

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


