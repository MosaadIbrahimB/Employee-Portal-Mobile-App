import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/home/presentation/home_screen.dart';
import 'package:employee_portal_mobile_app/feature/layout/control/layout_cubit.dart';
import 'package:employee_portal_mobile_app/feature/layout/presentation/widget/custom_bottom_navigation_bar_widget.dart';
import 'package:employee_portal_mobile_app/feature/person/presentation/screen/person_screen.dart';
import 'package:employee_portal_mobile_app/feature/request/presentation/screen/request_screen.dart';
import 'package:employee_portal_mobile_app/feature/salary/presentation/screen/salary_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  final List<Widget> listScreen = const [
    HomeScreen(),
    RequestScreen(),
    Text("الاجازات"),
    SalaryScreen(),
    PersonScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LayoutCubit(),
      child: BlocBuilder<LayoutCubit, int>(
        builder: (context, currentIndex) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: listScreen[currentIndex],
            bottomNavigationBar:CustomBottomNavigationBarWidget()

          );
        },
      ),
    );
  }

}





