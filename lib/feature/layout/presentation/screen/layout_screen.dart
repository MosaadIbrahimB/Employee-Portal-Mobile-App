import 'package:employee_portal_mobile_app/feature/layout/export_Layout_file.dart';
import 'package:employee_portal_mobile_app/feature/vacation/presentation/screen/vacation_screen.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  final List<Widget> listScreen = const [
    HomeScreen(),
    RequestScreen(),
    VacationScreen() ,
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
            body: SafeArea(child: listScreen[currentIndex]),
            bottomNavigationBar:CustomBottomNavigationBarWidget()
          );
        },
      ),
    );
  }

}





