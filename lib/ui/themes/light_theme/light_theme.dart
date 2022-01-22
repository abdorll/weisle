import 'package:flutter/material.dart';
import 'package:weisle/ui/constants/colors.dart';

import 'app_bar_theme.dart';
import 'form_field_theme.dart';

ThemeData lightTheme = ThemeData(
    fontFamily: 'Poppins',
    inputDecorationTheme: inputDecoration,
    appBarTheme: appBarTheme,
    colorScheme: ThemeData.light()
        .colorScheme
        .copyWith(secondary: colorSecondary, primary: colorPrimary));
