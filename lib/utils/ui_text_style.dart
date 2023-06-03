
import 'package:kheloo/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class UITextStyle {

  /*
#  {
#    FontWeight.w100: 'Thin',
#    FontWeight.w200: 'ExtraLight',
#    FontWeight.w300: 'Light',
#    FontWeight.w400: 'Regular',
#    FontWeight.w500: 'Medium',
#    FontWeight.w600: 'SemiBold',
#    FontWeight.w700: 'Bold',
#    FontWeight.w800: 'ExtraBold',
#    FontWeight.w900: 'Black',
#  }
   */


  static TextStyle getTextStyle({FontStyle? fontStyle,String? fontFamily, int? fontSize, Color? color, FontWeight? fontWeight, bool isFixed = false, double? characterSpacing, double? wordSpacing, double? lineSpacing, TextDecoration? decoration}) {
    double finalFontSize = (fontSize ?? 12).toDouble();
    if (isFixed) {
      finalFontSize = finalFontSize;
    }

    return TextStyle(
        fontSize: finalFontSize,
        fontFamily: fontFamily ,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color ?? AppColor.blackColor,
        letterSpacing: characterSpacing,
        wordSpacing: wordSpacing,
        height: lineSpacing,
        fontStyle: fontStyle ?? FontStyle.normal,
        decoration: decoration
    );
  }

  static boldTextStyle({int? fontSize, Color? color, double? characterSpacing, double? wordSpacing, double? lineSpacing, TextDecoration? decoration}) {
    return getTextStyle(
      fontWeight: FontWeight.w700,
      fontSize: fontSize ?? 12,
      color: color ?? AppColor.blackColor,
      characterSpacing: characterSpacing,
      wordSpacing: wordSpacing,
      lineSpacing: lineSpacing,
      decoration: decoration,
    );
  }
  static boldItalicTextStyle({int? fontSize, Color? color, double? characterSpacing, double? wordSpacing, double? lineSpacing, TextDecoration? decoration}) {
    return getTextStyle(
      fontWeight: FontWeight.w700,
      fontSize: fontSize ?? 12,
      color: color ?? AppColor.blackColor,
      characterSpacing: characterSpacing,
      wordSpacing: wordSpacing,
      lineSpacing: lineSpacing,
      fontStyle: FontStyle.italic,
      decoration: decoration,
    );
  }

  static blackTextStyle({int? fontSize, Color? color, double? characterSpacing, double? wordSpacing, double? lineSpacing, TextDecoration? decoration}) {
    return getTextStyle(
      fontWeight: FontWeight.w900,
      fontSize: fontSize ?? 12,
      color: color ?? AppColor.blackColor,
      characterSpacing: characterSpacing,
      wordSpacing: wordSpacing,
      lineSpacing: lineSpacing,
      decoration: decoration,
    );
  }

  static extraBoldTextStyle({int? fontSize, Color? color, double? characterSpacing, double? wordSpacing, double? lineSpacing, TextDecoration? decoration}) {
    return getTextStyle(
      fontWeight: FontWeight.w800,
      fontSize: fontSize ?? 12,
      color: color ?? AppColor.blackColor,
      characterSpacing: characterSpacing,
      wordSpacing: wordSpacing,
      lineSpacing: lineSpacing,
      decoration: decoration,
    );
  }

  static extraBoldItalicTextStyle({int? fontSize, Color? color, double? characterSpacing, double? wordSpacing, double? lineSpacing, TextDecoration? decoration}) {
    return getTextStyle(
      
      fontWeight: FontWeight.w800,
      fontSize: fontSize ?? 12,
      color: color ?? AppColor.blackColor,
      characterSpacing: characterSpacing,
      wordSpacing: wordSpacing,
      lineSpacing: lineSpacing,
      fontStyle: FontStyle.italic,
      decoration: decoration,
    );
  }

  static semiBoldTextStyle({int? fontSize, Color? color, double? characterSpacing, double? wordSpacing, double? lineSpacing, TextDecoration? decoration}) {
    return getTextStyle(
      
      fontWeight: FontWeight.w600,
      fontSize: fontSize ?? 12,
      color: color ?? AppColor.blackColor,
      characterSpacing: characterSpacing,
      wordSpacing: wordSpacing,
      lineSpacing: lineSpacing,
      decoration: decoration,
    );
  }

  static semiBoldItalicTextStyle({int? fontSize, Color? color, double? characterSpacing, double? wordSpacing, double? lineSpacing, TextDecoration? decoration}) {
    return getTextStyle(
      
      fontWeight: FontWeight.w600,
      fontSize: fontSize ?? 12,
      color: color ?? AppColor.blackColor,
      characterSpacing: characterSpacing,
      wordSpacing: wordSpacing,
      lineSpacing: lineSpacing,
      fontStyle: FontStyle.italic,
      decoration: decoration,
    );
  }

  static mediumTextStyle({int? fontSize, Color? color, double? characterSpacing, double? wordSpacing, double? lineSpacing, TextDecoration? decoration}) {
    return getTextStyle(
      
      fontWeight: FontWeight.w500,
      fontSize: fontSize ?? 12,
      color: color ?? AppColor.blackColor,
      characterSpacing: characterSpacing,
      wordSpacing: wordSpacing,
      lineSpacing: lineSpacing,
      decoration: decoration,
    );
  }

  static mediumItalicTextStyle({int? fontSize, Color? color, double? characterSpacing, double? wordSpacing, double? lineSpacing, TextDecoration? decoration}) {
    return getTextStyle(
      
      fontWeight: FontWeight.w500,
      fontSize: fontSize ?? 12,
      color: color ?? AppColor.blackColor,
      characterSpacing: characterSpacing,
      wordSpacing: wordSpacing,
      lineSpacing: lineSpacing,
      fontStyle: FontStyle.italic,
      decoration: decoration,
    );
  }


  static regularTextStyle({int? fontSize, Color? color, double? characterSpacing, double? wordSpacing, double? lineSpacing, TextDecoration? decoration}) {
    return getTextStyle(
      
      fontWeight: FontWeight.w400,
      fontSize: fontSize ?? 12,
      color: color ?? AppColor.blackColor,
      characterSpacing: characterSpacing,
      wordSpacing: wordSpacing,
      lineSpacing: lineSpacing,
      decoration: decoration,
    );
  }

  static italicTextStyle({int? fontSize, Color? color, double? characterSpacing, double? wordSpacing, double? lineSpacing, TextDecoration? decoration}) {
    return getTextStyle(
      
      fontWeight: FontWeight.w400,
      fontSize: fontSize ?? 12,
      color: color ?? AppColor.blackColor,
      characterSpacing: characterSpacing,
      wordSpacing: wordSpacing,
      lineSpacing: lineSpacing,
      fontStyle: FontStyle.italic,
      decoration: decoration,
    );
  }

  static lightTextStyle({int? fontSize, Color? color, double? characterSpacing, double? wordSpacing, double? lineSpacing, TextDecoration? decoration}) {
    return getTextStyle(
      
      fontWeight: FontWeight.w300,
      fontSize: fontSize ?? 12,
      color: color ?? AppColor.blackColor,
      characterSpacing: characterSpacing,
      wordSpacing: wordSpacing,
      lineSpacing: lineSpacing,
      decoration: decoration,
    );
  }
  static lightItalicTextStyle({int? fontSize, Color? color, double? characterSpacing, double? wordSpacing, double? lineSpacing, TextDecoration? decoration}) {
    return getTextStyle(
      
      fontWeight: FontWeight.w300,
      fontSize: fontSize ?? 12,
      color: color ?? AppColor.blackColor,
      characterSpacing: characterSpacing,
      wordSpacing: wordSpacing,
      lineSpacing: lineSpacing,
      fontStyle: FontStyle.italic,
      decoration: decoration,
    );
  }
  static extraLightTextStyle({int? fontSize, Color? color, double? characterSpacing, double? wordSpacing, double? lineSpacing, TextDecoration? decoration}) {
    return getTextStyle(
      
      fontWeight: FontWeight.w200,
      fontSize: fontSize ?? 12,
      color: color ?? AppColor.blackColor,
      characterSpacing: characterSpacing,
      wordSpacing: wordSpacing,
      lineSpacing: lineSpacing,
      decoration: decoration,
    );
  }
  static extraLightItalicTextStyle({int? fontSize, Color? color, double? characterSpacing, double? wordSpacing, double? lineSpacing, TextDecoration? decoration}) {
    return getTextStyle(
      
      fontWeight: FontWeight.w200,
      fontSize: fontSize ?? 12,
      color: color ?? AppColor.blackColor,
      characterSpacing: characterSpacing,
      wordSpacing: wordSpacing,
      lineSpacing: lineSpacing,
      fontStyle: FontStyle.italic,
      decoration: decoration,
    );
  }


  static thinTextStyle({int? fontSize, Color? color, double? characterSpacing, double? wordSpacing, double? lineSpacing, TextDecoration? decoration}) {
    return getTextStyle(
      
      fontWeight: FontWeight.w100,
      fontSize: fontSize ?? 12,
      color: color ?? AppColor.blackColor,
      characterSpacing: characterSpacing,
      wordSpacing: wordSpacing,
      lineSpacing: lineSpacing,
      decoration: decoration,
    );
  }
  static thinItalicTextStyle({int? fontSize, Color? color, double? characterSpacing, double? wordSpacing, double? lineSpacing, TextDecoration? decoration}) {
    return getTextStyle(
      
      fontWeight: FontWeight.w100,
      fontSize: fontSize ?? 12,
      color: color ?? AppColor.blackColor,
      characterSpacing: characterSpacing,
      wordSpacing: wordSpacing,
      lineSpacing: lineSpacing,
      fontStyle: FontStyle.italic,
      decoration: decoration,
    );
  }


}