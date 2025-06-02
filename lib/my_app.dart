import 'package:employee_portal_mobile_app/feature/layout/export_Layout_file.dart';

import 'core/configure/theme/app_theme.dart';
import 'feature/day/presentation/widget/day_details_request/day_details_request_widget.dart';
import 'feature/day/presentation/widget/tab_add_additional/Additional_request_screen.dart';
import 'feature/day/presentation/day_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {


    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme:AppTheme.themeLight() ,
          debugShowCheckedModeBanner: false,
          // onGenerateRoute: AppRoute.onGenerateRoute,
          home: Directionality(
              textDirection: TextDirection.rtl,child: DayDetailsRequestWidget()),
          locale: Locale('ar'),

        );
      },
    );
  }
}
