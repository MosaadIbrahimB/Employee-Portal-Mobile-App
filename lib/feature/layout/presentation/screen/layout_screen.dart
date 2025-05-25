import 'package:employee_portal_mobile_app/feature/layout/export_Layout_file.dart';

import '../../../request/presentation/widget/dropdown_widget.dart';

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
            body: listScreen[currentIndex],
            bottomNavigationBar:CustomBottomNavigationBarWidget()
          );
        },
      ),
    );
  }

}





