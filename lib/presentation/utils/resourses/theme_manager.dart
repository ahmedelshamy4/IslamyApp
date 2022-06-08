import 'package:flutter/material.dart';
import 'package:islamy_app/presentation/utils/resourses/font_manager.dart';
import 'package:islamy_app/presentation/utils/resourses/style_manager.dart';

import 'color_manager.dart';
import 'values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //*  main Colors
    primaryColor: ColorManager.white,
    primaryColorLight: ColorManager.white,
    primaryColorDark: ColorManager.white,
    disabledColor: ColorManager.white,
    splashColor: ColorManager.white,

    //*  Card View theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

    //*  button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.white,
    ),
    //*  text theme
    textTheme: TextTheme(
      displayMedium: getMediumStyle(
          color: ColorManager.darkGrey, fontSize: FontSizeManager.s20),
      displayLarge: getBoldStyle(
          color: ColorManager.darkGrey, fontSize: FontSizeManager.s22),
      displaySmall: getSmallStyle(
          color: ColorManager.darkGrey, fontSize: FontSizeManager.s18),
      //* appBarTitle
      headlineMedium: getMediumStyle(
          color: ColorManager.darkGrey, fontSize: FontSizeManager.s20),
      //* bag title
      headlineLarge: getSmallStyle(
          color: ColorManager.darkGrey, fontSize: FontSizeManager.s22),
      //* smoll text
      titleSmall: getRegularStyle(
          color: ColorManager.darkGrey, fontSize: FontSizeManager.s18),
      titleMedium: getMediumStyle(
          color: ColorManager.darkGrey, fontSize: FontSizeManager.s20),
      titleLarge: getSmallStyle(
          color: ColorManager.primary, fontSize: FontSizeManager.s22),
    ),
  );
}
