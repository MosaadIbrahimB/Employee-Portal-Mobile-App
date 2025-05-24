import 'package:employee_portal_mobile_app/core/utils/app_text_style.dart';
import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/home/presentation/home_screen.dart';
import 'package:employee_portal_mobile_app/feature/person/presentation/screen/person_screen.dart';
import 'package:employee_portal_mobile_app/feature/salary/presentation/screen/salary_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int currentIndex = 0;
  final List<Widget> listScreen = [
    HomeScreen(),
    Text("الطلبات"),
    Text("الاجازات"),
   SalaryScreen(),
    PersonScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: listScreen[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8).r,
            topRight: Radius.circular(8).r,
          ),
          border: Border(top: BorderSide(color: Color(0xffF5F5F5), width: 2.w)),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
          ),

          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,

            currentIndex: currentIndex,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            elevation: 0,
            selectedItemColor: Color(0xff36B0E3),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedLabelStyle: AppTextStyle.iBMP10w700,
            unselectedLabelStyle: AppTextStyle.iBMP10w700.copyWith(
              color: Colors.black38,
            ),
            items: [
              BottomNavigationBarItem(
                icon: SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child: SvgPicture.asset(
                    "assets/image/tab/home.svg",
                    color: currentIndex == 0 ? AppColor.primary : null,
                  ),
                ),
                label: "الرئيسية",
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child: SvgPicture.asset(
                    "assets/image/tab/document-list.svg",
                    color: currentIndex == 1 ? AppColor.primary : null,
                  ),
                ),
                label: "الطلبات",
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child: SvgPicture.asset(
                    "assets/image/tab/calendar-plus.svg",
                    color: currentIndex ==2 ? AppColor.primary : null,
                  ),
                ),
                label: "الاجازات",
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child: SvgPicture.asset(
                    "assets/image/tab/money-bill.svg",
                    color: currentIndex ==3 ? AppColor.primary : null,
                  ),
                ),
                label: "المرتبات",
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child: SvgPicture.asset(
                    "assets/image/tab/person.svg",
                    color: currentIndex ==4 ? AppColor.primary : null,
                  ),
                ),
                label: "الملف الشخصى",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
