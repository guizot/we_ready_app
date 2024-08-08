import 'package:flutter/material.dart';
import '../../../data/core/const/shared_preferences_values.dart';
import '../../../data/data_source/shared/shared_preferences_data_source.dart';
import '../constant/theme_service_values.dart';
import '../extension/color_extension.dart';

class ThemeService extends ChangeNotifier {

  final SharedPreferenceDataSource sharedPreferenceDataSource;
  ThemeService({required this.sharedPreferenceDataSource}) {
    _themeMode = ThemeServiceValues.system;
    getPreferences();
  }

  late String _themeMode;
  String get themeMode => _themeMode;

  set themeMode(String value) {
    _themeMode = value;
    sharedPreferenceDataSource.setString(SharedPreferencesValues.currentTheme, value);
    notifyListeners();
  }

  getPreferences() async {
    _themeMode = await sharedPreferenceDataSource.getString(SharedPreferencesValues.currentTheme);
    if(_themeMode == "") {
      themeMode = ThemeServiceValues.system;
    }
    notifyListeners();
  }

  ThemeMode get currentThemeMode {
    switch(themeMode) {
      case ThemeServiceValues.light:
        return ThemeMode.light;
      case ThemeServiceValues.dark:
        return ThemeMode.dark;
      case ThemeServiceValues.system:
        return ThemeMode.system;
      default:
        return ThemeMode.system;
    }
  }

  ThemeData get getLightTheme {
    return ThemeData(
      colorSchemeSeed: HexColor('FFE7E9'),
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      useMaterial3: true,
    );
  }

  ThemeData get getDarkTheme {
    return ThemeData(
      colorSchemeSeed: HexColor('FFE7E9'),
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      useMaterial3: true,
    );
  }

}
