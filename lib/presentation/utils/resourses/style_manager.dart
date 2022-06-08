import 'package:flutter/material.dart';
import 'font_manager.dart';


TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontFamily: FontFamilyNames.fontFamily,
    fontWeight: fontWeight,
    fontSize: fontSize,
    color: color,
  );
}
//* small
TextStyle getSmallStyle(
    {double fontSize = FontSizeManager.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}
//* medium
TextStyle getMediumStyle(
    {double fontSize = FontSizeManager.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}
//* regular
TextStyle getRegularStyle(
    {double fontSize = FontSizeManager.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}
//* Bold
TextStyle getBoldStyle(
    {double fontSize = FontSizeManager.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}
