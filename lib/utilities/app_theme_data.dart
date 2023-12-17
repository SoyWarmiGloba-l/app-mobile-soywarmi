import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soywarmi_app/utilities/nb_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeData {
  AppThemeData._();

  static final ThemeData theme = ThemeData(
    scaffoldBackgroundColor: NBColorWhite,
    primaryColor: NBPrimaryColor,
    useMaterial3: false,
    canvasColor: NBColorBlack,
    primaryColorLight: NBColorWhite,
    primaryColorDark: NBColorBlack,
    shadowColor: NBColorBlack,
    unselectedWidgetColor: NBNotSelected,
    splashColor: NBColorWhite,
    secondaryHeaderColor: NBNotSelected,
    dividerColor: NBColorBlack,
    fontFamily: GoogleFonts.lato().fontFamily,
    appBarTheme: const AppBarTheme(
      color: NBSecondPrimaryColor,
      iconTheme: IconThemeData(color: NBColorBlack),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: NBColorWhite,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: NBColorBlack,
    ),
    colorScheme: const ColorScheme.light(primary: NBPrimaryColor),
    cardTheme: const CardTheme(
      color: NBColorWhite,
    ),
    iconTheme: const IconThemeData(
      color: NBColorBlack,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: NBColorWhite,
    ),
    textTheme: const TextTheme(
      labelLarge: TextStyle(color: NBPrimaryColor),
      titleLarge: TextStyle(color: NBColorBlack),
      titleSmall: TextStyle(color: NBColorBlackGray),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
