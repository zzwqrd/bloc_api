import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static Color lightBackgroundColor = const Color(0xfff2f2f2);
  static Color lightPrimaryColor = const Color(0xfff2f2f2);
  static Color lightAccentColor = Colors.blueGrey.shade200;
  static Color lightParticlesColor = const Color(0x44948282);

  static Color darkBackgroundColor = const Color(0xFF1A2127);
  static Color darkPrimaryColor = const Color(0xFF1A2127);
  static Color darkAccentColor = Colors.blueGrey.shade600;
  static Color darkParticlesColor = const Color(0x441C2A3D);
  static Color maingrayColor = const Color(0xFF9C9C9C);

  static const String boldFont = 'Bold';

  static const double sizedBox = 18;

  static const double padding = 15;

  static TextStyle appStayle = const TextStyle(
    fontSize: 14,
    color: Colors.grey,
    // fontFamily: fontName,
  );
  static TextStyle nameProduct = const TextStyle(
    fontSize: 14,
    color: Colors.pink,
    // fontFamily: fontName,
  );
  static TextStyle descriptionProduct = const TextStyle(
    fontSize: 14,
    color: Colors.grey,
    // fontFamily: fontName,
  );
  static TextStyle priceBeforeDiscountProduct =  TextStyle(
    decoration: TextDecoration.lineThrough,
    decorationColor: Colors.pink,
    decorationThickness: 2,
    fontSize: 14,
    fontFamily: Family.regular,
    color: Colors.pink,
  );

  const AppTheme._();

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: lightPrimaryColor,
    accentColor: lightAccentColor,

    visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: Colors.grey[200],
      backgroundColor: Colors.grey,
      fontFamily: 'TajawalBold',
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        toolbarHeight: 50,
        titleTextStyle: const TextStyle(
          color:Colors.black,
          fontFamily: 'TajawalBold',
          fontWeight: FontWeight.w900,
          fontSize: 14,
        ),
      ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: darkPrimaryColor,
    accentColor: darkAccentColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor:const Color(0xFF252424),
      backgroundColor: Colors.grey,
      fontFamily: 'TajawalBold',
      appBarTheme:const AppBarTheme(
        backgroundColor: Color(0xFF252424),
        elevation: 0,
        toolbarHeight: 50,
        titleTextStyle:  TextStyle(
          color: Colors.white,
          fontFamily: 'TajawalBold',
          fontWeight: FontWeight.w900,
          fontSize: 14,
        ),
      ),
  );

  static Brightness get currentSystemBrightness =>
      SchedulerBinding.instance.window.platformBrightness;

  static setStatusBarAndNavigationBarColors(ThemeMode themeMode) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
      themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarIconBrightness:
      themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: themeMode == ThemeMode.light
          ? lightBackgroundColor
          : darkBackgroundColor,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
  }
}

extension ThemeExtras on ThemeData {
  Color get particlesColor => this.brightness == Brightness.light
      ? AppTheme.lightParticlesColor
      : AppTheme.darkParticlesColor;
}


class Family {
  Family._();
  static String bold = "Bold";
  static String regular = "Regular";
  static String fontFamilyMedium = "Medium";
  static String light = "Light";
  static String fontFamilyExtraBold = "ExtraBold";
  static String semiBold = "SemiBold";
}
