import 'package:employee_portal_mobile_app/feature/layout/presentation/screen/layout_screen.dart';
import 'package:employee_portal_mobile_app/feature/login/presentation/screen/login_screen.dart';
import 'package:employee_portal_mobile_app/feature/onboarding/presentation/screen/onboarding_screen.dart';
import 'package:employee_portal_mobile_app/feature/splash/presentation/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/configure/route/app_route.dart';

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
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              elevation: 0,
              scrolledUnderElevation: 0
            )
          ),
          debugShowCheckedModeBanner: false,
          // onGenerateRoute: AppRoute.onGenerateRoute,
          locale: Locale('ar'),

          home: Directionality(
            textDirection: TextDirection.rtl,
            child: LayoutScreen(),
          ),
        );
      },
    );
  }
}
