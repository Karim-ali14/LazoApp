import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {

  static const Color mainAppColor = Color(0xFFE21B33);
  static const Color mainAppColorLight = Color(0xFFF7DBDE);
  static const Color mainAppColorBright = Color(0xFFe6f4ff);
  static const Color mainAppColorDark = Color(0xFF003A59);
  static const Color secondaryAppColorLight = Color(0xFF4FC2FF);
  static const Color secondaryAppColorDark = Color(0xFF439FD0);
  static const Color secondaryTempAppColorDark = Color(0xFFF04741);
  static const Color green = Color(0xFF23B574);

  static const Color appGrey = Color(0xFFBEBEBE); //#E5E5E5
  static const Color appGrey2 = Color(0xFF888888);
  static const Color appGrey3 = Color(0xFFe5e5e5);
  static const Color appGrey4 = Color(0xFFF5F5F5);
  static const Color appGrey5 = Color(0xFFCECECE);
  static const Color appGrey6 = Color(0xFFE6E9EC);
  static const Color appGrey7 = Color(0xFF8088A4);
  static const Color appLightGrey = Color(0xFFe5e5e5);
  static const Color appLightGreyV2 = Color(0xFFF0F0F0);
  static const Color appDarkerGrey = Color(0xFF898989);

  static const Color failureColor = Color(0xFFc61313);
  static const Color successColor = Color(0xFF7cbf2b);
  static const Color pendingColor = Color(0xFFff904a);
  static const Color lightAlert = Color(0xFFeb6866);
  static const Color blue = Color(0xFF1256d2);

  static const Color selectedBackgroundColor = Color(0xFF23B574);
  static const Color mainBackgroundLightColor = Color(0xFFFCFCFC);
  static const Color mainBackgroundDarkColor = Color(0xFF0E0314);
  static const Color mainBackgroundSemiDarkColor = Color(0xFF0E0322);
  static const Color cardColor = Color(0xFFfcfcfc);
  static const Color lightTextColor = Colors.white;
  static Color? lightDetailTextColor = Colors.grey[200];
  static const Color darkDetailTextColor = Colors.black54;
  static const Color darkTextColor = Colors.black;

  static const kPrimaryColor = Color(0xFF1ad3b0);
  static const kContentColorLightTheme = Color(0xFF1D1D35);
  static const kContentColorDarkTheme = Color(0xFFF5FCF9);
  static const kWarninngColor = Color(0xFFF3BB1C);
  static const kYellow = Color(0xFFEC9922);
  static const kErrorColor = Color(0xFFF03738);

  static const kDefaultPadding = 20.0;

  static const MaterialColor appSwatch = MaterialColor(
    0xFFE21B33,
    <int, Color>{
      50: Color(0xFFE21B33),
      100: Color(0xFFE21B33),
      200: Color(0xFFE21B33),
      300: Color(0xFFE21B33),
      400: Color(0xFFE21B33),
      500: Color(0xFFE21B33),
      600: Color(0xFFE21B33),
      700: Color(0xFFE21B33),
      800: Color(0xFFE21B33),
      900: Color(0xFFE21B33),
    },
  );

  static const TextTheme appTextTheme = TextTheme(
    bodyLarge: TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.w600
    ),
    bodyMedium: TextStyle(
        color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
    bodySmall: TextStyle(
        color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
    displayLarge: TextStyle(
        color: Colors.black, fontSize: 26, fontWeight: FontWeight.w800),
    displayMedium: TextStyle(
        color: Colors.black, fontSize: 22, fontWeight: FontWeight.w800),
    displaySmall: TextStyle(
        color: Colors.black, fontSize: 18, fontWeight: FontWeight.w800),
    titleMedium: TextStyle(
        color: Colors.black, fontSize: 13, fontWeight: FontWeight.normal),
    titleSmall: TextStyle(
        color: appDarkerGrey, fontSize: 12, fontWeight: FontWeight.normal),
    titleLarge: TextStyle(
        color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal),
  );

  static final mediumBodyBlue = appTextTheme.bodyMedium?.copyWith(color: AppTheme.mainAppColor);

  static final mediumBodyBlue2 = appTextTheme.bodyMedium?.copyWith(color: AppTheme.mainAppColor,fontSize: 14);


  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: mainAppColor,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)
      ),
      primaryColorLight: mainAppColor,
      scaffoldBackgroundColor: mainBackgroundLightColor,
      bottomAppBarColor: Colors.white,
      backgroundColor: Colors.white,
      dividerColor:Colors.transparent,
      expansionTileTheme: const ExpansionTileThemeData(backgroundColor: Colors.transparent,collapsedBackgroundColor: Colors.transparent),
      radioTheme: RadioThemeData(fillColor: MaterialStateProperty.all(appSwatch)),
      hintColor: Colors.grey,
      fontFamily: 'Proxima',
      primarySwatch: appSwatch,
      elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(mainBackgroundDarkColor))),
      popupMenuTheme: const PopupMenuThemeData(color: Colors.white),
      checkboxTheme: CheckboxThemeData(checkColor: MaterialStateProperty.all(Colors.white),fillColor: MaterialStateProperty.all(appSwatch)),
      textTheme: appTextTheme,
      tabBarTheme: const TabBarTheme(
          indicatorColor:mainAppColor,
          unselectedLabelColor:appGrey2,
          labelColor: mainAppColor
      )
  );

  // Text style
  static const TextStyle styleWithTextBlackAdelleSansExtendedFonts20w700 = TextStyle(
      color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700);

  static const TextStyle styleWithTextBlackAdelleSansExtendedFonts18w700 = TextStyle(
      color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700);

  static const TextStyle styleWithTextGray7AdelleSansExtendedFonts16w400 = TextStyle(
      color: appGrey7 , fontSize: 16, fontWeight: FontWeight.w400);

  static const TextStyle styleWithTextBlackAdelleSansExtendedFonts16w400 = TextStyle(
      color: Colors.black , fontSize: 16, fontWeight: FontWeight.w400);

  static const TextStyle styleWithTextRedAdelleSansExtendedFonts16w400 = TextStyle(
      color: mainAppColor , fontSize: 16, fontWeight: FontWeight.w400);

  static const TextStyle styleWithTextBlackAdelleSansExtendedFonts14w400 = TextStyle(
      color: Colors.black , fontSize: 14, fontWeight: FontWeight.w400);

  static const TextStyle styleWithTextWhiteAdelleSansExtendedFonts14w400 = TextStyle(
      color: Colors.white , fontSize: 14, fontWeight: FontWeight.w400);


  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: secondaryAppColorDark,
    primaryColorLight: mainAppColor,
    expansionTileTheme: const ExpansionTileThemeData(backgroundColor: Colors.transparent,collapsedBackgroundColor: Colors.transparent),
    radioTheme: RadioThemeData(fillColor: MaterialStateProperty.all(appSwatch)),
    appBarTheme: const AppBarTheme(
        backgroundColor: mainBackgroundSemiDarkColor,
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
    hintColor: Colors.grey,
    primarySwatch: appSwatch,
    dividerColor:Colors.transparent,
    scaffoldBackgroundColor: mainBackgroundDarkColor,
    fontFamily: 'Proxima',
    backgroundColor: mainBackgroundSemiDarkColor,
    bottomAppBarColor: mainBackgroundSemiDarkColor,
    elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(mainBackgroundDarkColor))),
    checkboxTheme: CheckboxThemeData(checkColor: MaterialStateProperty.all(Colors.white),fillColor: MaterialStateProperty.all(appSwatch)),
    popupMenuTheme: const PopupMenuThemeData(color:mainBackgroundSemiDarkColor),
    cardColor: cardColor,
    textTheme: appTextTheme,
  );

  static ThemeData expandedTileTheme =
  ThemeData(dividerColor: Colors.transparent);

}

const appGradiant = LinearGradient(
  colors: [
    AppTheme.mainAppColor,
    AppTheme.secondaryAppColorLight
  ],
  begin: AlignmentDirectional.bottomStart,
  end: AlignmentDirectional.topEnd,
);
