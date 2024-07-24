
import 'package:flutter/material.dart';
import 'package:we_ready_app/presentation/core/extension/color_extension.dart';

class ThemeService {

  static ThemeData currentTheme(BuildContext ctx) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        primary: Colors.white,
        seedColor: HexColor('FFE7E9'),
      ),
      fontFamily: 'Poppins',
      useMaterial3: true,
    );
  }

}