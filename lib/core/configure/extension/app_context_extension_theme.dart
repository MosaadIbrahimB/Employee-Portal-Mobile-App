import 'package:flutter/material.dart';

extension AppContextensiontExtTheme on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get text => theme.textTheme;
  ColorScheme get color => theme.colorScheme;

  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;
}
