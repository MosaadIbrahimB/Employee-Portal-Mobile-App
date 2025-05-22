import 'package:employee_portal_mobile_app/core/utils/import_file.dart';
import 'package:employee_portal_mobile_app/feature/onboarding/presentation/screen/onboarding_screen.dart';
import 'package:employee_portal_mobile_app/feature/splash/presentation/screen/splash_screen.dart';


class AppRoute {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String home = '/home';
  static const String details = '/details';

  static Route onGenerateRoute(RouteSettings routSetting) {
    switch (routSetting.name) {
      case AppRoute.splash:
        return MaterialPageRoute(builder: (context) => SplashScreen(), settings: routSetting,);
      case AppRoute.onboarding:
        return MaterialPageRoute(builder: (context) => OnboardingScreen(), settings: routSetting,);
      default:
        return MaterialPageRoute(builder: (context) => _defaultScreen());
    }
  }

  static _defaultScreen() {
    return Scaffold(body: Center(child: Text("Default screen")));
  }
}
