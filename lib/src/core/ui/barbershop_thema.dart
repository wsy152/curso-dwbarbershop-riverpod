import 'package:curso_dw_barbershop/src/core/ui/constants.dart';
import 'package:flutter/material.dart';

sealed class BarbershopThema {
  static const _defaultInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: ColorsConstants.gray));

  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      labelStyle: const TextStyle(color: ColorsConstants.gray),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      errorBorder: _defaultInputBorder.copyWith(
        borderSide: const BorderSide(color: ColorsConstants.red),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: ColorsConstants.brow,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))

      ),      
    ),
    fontFamily: FontsConstants.fontFamily
  );
}
