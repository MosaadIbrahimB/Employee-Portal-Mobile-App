import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:employee_portal_mobile_app/core/service/dependency_injection/depend_inject.dart' as di;
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white, // navigation bar color
    statusBarColor: Colors.white, // status bar color
    statusBarIconBrightness: Brightness.dark, // status bar icons' color
    systemNavigationBarIconBrightness: Brightness.dark, //navigation bar icons' color
  ));
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

