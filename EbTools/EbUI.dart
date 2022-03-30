// Packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//================================================
class EbUI {
  static int _xs = 0;
  static int _sm = 576;
  static int _md = 768;
  static int _lg = 992;
  static int _xl = 1200;
  //
  static ThemeMode theme = ThemeMode.system;
  static double fontSize = 16;
  static double iconSize = 20;
  static String fontFamily = "Roboto";
  static EbUIColors colors = EbUIColors();
  //
  static double screen(BuildContext context, double? xs, double? sm, double? md,
      double? lg, double? xl) {
    // width and res
    double w = MediaQuery.of(context).size.width;
    double r = xs ?? sm ?? md ?? lg ?? xl;
    // check allwidth and return correct value
    if (xs != null && w >= _xs) r = xs;
    if (sm != null && w >= _sm) r = sm;
    if (md != null && w >= _md) r = md;
    if (lg != null && w >= _lg) r = lg;
    if (xl != null && w >= _xl) r = xl;
    //return
    return r;
  }
  //
  static ThemeData themeData() {
    return ThemeData(
      applyElevationOverlayColor: true,
      // materialTapTargetSize,
      // splashFactory,
      // visualDensity,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: colors.primary,
        onPrimary: colors.primaryContrast,
        secondary: colors.accent,
        onSecondary: colors.accentContrast,
        error: colors.error,
        onError: colors.errorContrast,
        background: colors.white,
        onBackground: colors.dark,
        surface: colors.light,
        onSurface: colors.dark,
        shadow: colors.dark.withOpacity(0.75),
      ),
      brightness: Brightness.light,
      primaryColor: colors.primary,
      primaryColorLight: colors.primaryLight,
      primaryColorDark: colors.primaryDark,
      // focusColor,
      hoverColor: colors.dark.withOpacity(0.75),
      shadowColor: colors.dark.withOpacity(0.75),
      // canvasColor,
      // scaffoldBackgroundColor,
      // bottomAppBarColor,
      // cardColor,
      // dividerColor,
      // highlightColor,
      // splashColor,
      // selectedRowColor,
      // unselectedWidgetColor,
      // disabledColor,
      // secondaryHeaderColor,
      backgroundColor: colors.white,
      // dialogBackgroundColor,
      // indicatorColor,
      // hintColor,
      errorColor: colors.error,
      // toggleableActiveColor,
      // textSelectionColor,
      // cursorColor,
      // textSelectionHandleColor,
      // buttonColor,
      fontFamily: fontFamily,
      // fixTextFieldOutlineLabel,
      // primaryColorBrightness,
      // typography,
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: fontSize * 1.25,
          fontFamily: fontFamily,
        ),
        displayMedium: TextStyle(
          fontSize: fontSize,
          fontFamily: fontFamily,
        ),
        displaySmall: TextStyle(
          fontSize: fontSize * 0.75,
          fontFamily: fontFamily,
        ),
        headlineLarge: TextStyle(
          fontSize: fontSize * 1.25,
          fontFamily: fontFamily,
        ),
        headlineMedium: TextStyle(
          fontSize: fontSize,
          fontFamily: fontFamily,
        ),
        headlineSmall: TextStyle(
          fontSize: fontSize * 0.75,
          fontFamily: fontFamily,
        ),
        titleLarge: TextStyle(
          fontSize: fontSize * 1.25,
          fontFamily: fontFamily,
        ),
        titleMedium: TextStyle(
          fontSize: fontSize,
          fontFamily: fontFamily,
        ),
        titleSmall: TextStyle(
          fontSize: fontSize * 0.75,
          fontFamily: fontFamily,
        ),
        bodyLarge: TextStyle(
          fontSize: fontSize * 1.25,
          fontFamily: fontFamily,
        ),
        bodyMedium: TextStyle(
          fontSize: fontSize,
          fontFamily: fontFamily,
        ),
        bodySmall: TextStyle(
          fontSize: fontSize * 0.75,
          fontFamily: fontFamily,
        ),
        labelLarge: TextStyle(
          fontSize: fontSize * 1.25,
          fontFamily: fontFamily,
        ),
        labelMedium: TextStyle(
          fontSize: fontSize,
          fontFamily: fontFamily,
        ),
        labelSmall: TextStyle(
          fontSize: fontSize * 0.75,
          fontFamily: fontFamily,
        ),
        // TextStyle? headline1,
        // TextStyle? headline2,
        // TextStyle? headline3,
        // TextStyle? headline4,
        // TextStyle? headline5,
        // TextStyle? headline6,
        // TextStyle? subtitle1,
        // TextStyle? subtitle2,
        // TextStyle? bodyText1,
        // TextStyle? bodyText2,
        // TextStyle? caption,
        // TextStyle? button,
        // TextStyle? overline,
      ),
      // primaryTextTheme,
      // iconTheme,
      // primaryIconTheme,
      // appBarTheme,
      // bannerTheme,
      // bottomAppBarTheme,
      // bottomNavigationBarTheme,
      // bottomSheetTheme,
      // buttonBarTheme,
      // buttonTheme,
      // cardTheme,
      // checkboxTheme,
      // chipTheme,
      // dataTableTheme,
      // dialogTheme,
      // dividerTheme,
      // drawerTheme,
      // elevatedButtonTheme,
      // floatingActionButtonTheme,
      // listTileTheme,
      // navigationBarTheme,
      // navigationRailTheme,
      // outlinedButtonTheme,
      // popupMenuTheme,
      // progressIndicatorTheme,
      // radioTheme,
      // sliderTheme,
      // snackBarTheme,
      // switchTheme,
      // tabBarTheme,
      // textButtonTheme,
      // textSelectionTheme,
      // timePickerTheme,
      // toggleButtonsTheme,
      // tooltipTheme,
      // useTextSelectionTheme,
      // cupertinoOverrideTheme,
      // inputDecorationTheme,
      // pageTransitionsTheme,
      // scrollbarTheme,
    );
  }
}

//================================================
class EbUIColors {
  //primary
  Color primary = Color(0xff0f92f0);
  Color primaryContrast = Color(0xff333333);
  Color primaryLight = Color(0xff87c9f7); //+25%
  Color primaryDark = Color(0xff084978); //-25%
  //accent
  Color accent = Color(0xffffbf00);
  Color accentContrast = Color(0xff333333);
  Color accentLight = Color(0xffffdf80);
  Color accentDark = Color(0xff806000);
  //light&dark
  Color white = Color(0xffffffff);
  Color light = Color(0xfff2f2f2);
  Color dark = Color(0xff333333);
  Color black = Color(0xff000000);
  //success
  Color success = Color(0xff32cd56);
  Color successContrast = Color(0xfff2f2f2);
  Color successLight = Color(0xff98e6ab);
  Color successDark = Color(0xff19672b);
  //alert
  Color alert = Color(0xff0099ff);
  Color alertContrast = Color(0xfff2f2f2);
  Color alertLight = Color(0xff80ccff);
  Color alertDark = Color(0xff80ccff);
  //warning
  Color warning = Color(0xffffbf00);
  Color warningrContrast = Color(0xff333333);
  Color warningLight = Color(0xffffdf80);
  Color warningDark = Color(0xff806000);
  //error
  Color error = Color(0xffd92638);
  Color errorContrast = Color(0xfff2f2f2);
  Color errorLight = Color(0xffec939c);
  Color errorDark = Color(0xff6c131c);

  // Color c = Color(0xff);

}


/* hex alpha
100% - FF
95% - F2
90% - E6
85% - D9
80% - CC
75% - BF
70% - B3
65% - A6
60% - 99
55% - 8C
50% - 80
45% - 73
40% - 66
35% - 59
30% - 4D
25% - 40
20% - 33
15% - 26
10% - 1A
5% - 0D
0% - 00
*/
