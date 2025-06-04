import 'package:employee_portal_mobile_app/core/service/check_connect_internet/cubit/connect_internet_cubit.dart';
import 'package:employee_portal_mobile_app/feature/layout/export_Layout_file.dart';
import 'package:employee_portal_mobile_app/feature/login/presentation/screen/login_screen.dart';

import 'core/component/not_connect_internet_widget.dart';
import 'core/configure/route/app_route.dart';
import 'core/configure/theme/app_theme.dart';
import 'core/service/dependency_injection/depend_inject.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => sl.get<ConnectInternetCubit>() ,//ConnectInternetCubit()..checkConnection(),
          child: MaterialApp(
            theme: AppTheme.themeLight(),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRoute.onGenerateRoute,
            // home: Directionality(
            //     textDirection: TextDirection.rtl,
            //     child: LoginScreen()),
            locale: Locale('ar'),
          )
        );
      },
    );
  }
}
