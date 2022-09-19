import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quotes/core/utils/app_colors.dart';
import 'package:quotes/core/utils/app_strings.dart';

ThemeData lightTheme() => ThemeData(

    fontFamily: AppStrings.fontfamily,
    appBarTheme:  AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: AppColors.primary,
      ),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    highlightColor:  AppColors.primary ,

    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
          secondary: AppColors.primary,
    ),
    hoverColor:  AppColors.primary,
    primaryColor: AppColors.primary,
    hintColor: AppColors.hint,
    scaffoldBackgroundColor: AppColors.backgrondColor,
    textTheme: const TextTheme(

      bodyText1: TextStyle(
        height: 1.3,

        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
    ));
