
import 'package:flutter/material.dart';

TextStyle regular({Color? color,
  double? fontSize,
  double? letterSpacing,
  TextDecoration? textdeco,
  double? height,

  FontWeight? fontWeight}) {
  return TextStyle(
    color: color ?? Colors.white,
    fontWeight: fontWeight ?? FontWeight.w400,
    fontSize: fontSize ?? 14,
    fontFamily: "Montserrat-Regular",
    letterSpacing: letterSpacing ?? 0,
    decoration: textdeco,
    height: height,

  );
}

TextStyle medium({Color? color,
  double? fontSize,
  double? letterSpacing,
  FontWeight? fontWeight}) {
  return TextStyle(
    color: color ?? Colors.white,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontSize: fontSize ?? 14,
    //fontFamily: FontRes.poppinsMedium,
    fontFamily: "Montserrat-Medium",
    letterSpacing: letterSpacing ?? 0,
  );
}

TextStyle light({Color? color,
  double? fontSize,
  double? letterSpacing,
  TextDecoration? textdeco,
  FontWeight? fontWeight}) {
  return TextStyle(
    color: color ?? Colors.white,
    fontWeight: fontWeight ?? FontWeight.w600,
    fontSize: fontSize ?? 14,
    decoration: textdeco,
    fontFamily: "Montserrat-Light",
    letterSpacing: letterSpacing ?? 0,
  );
}

TextStyle bold({Color? color,
  double? fontSize,
  double? letterSpacing,
  FontWeight? fontWeight}) {
  return TextStyle(
    color: color ?? Colors.white,
    fontWeight: fontWeight ?? FontWeight.bold,
    fontSize: fontSize ?? 14,
    fontFamily: "Montserrat-Bold",
    letterSpacing: letterSpacing ?? 0,
  );
}