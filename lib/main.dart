import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_ready_app/presentation/core/constant/theme_service_values.dart';
import 'package:we_ready_app/presentation/core/service/route_service.dart';
import 'package:we_ready_app/presentation/core/service/theme_service.dart';
import 'package:we_ready_app/injector.dart' as di;
import 'injector.dart';

void main() async {

  /// ENSURE INITIALIZED
  WidgetsFlutterBinding.ensureInitialized();

  /// INIT DEPENDENCY INJECTION
  await di.init();

  /// RUN APP
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => sl<ThemeService>(),
        )
      ],
      child: Consumer<ThemeService> (
        builder: (context, ThemeService themeService, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'We Ready App',
            theme: themeService.currentThemeData(ThemeServiceValues.light),
            darkTheme: themeService.currentThemeData(ThemeServiceValues.dark),
            themeMode: themeService.currentThemeMode,
            onGenerateRoute: RouteService.generate,
          );
        },
      ),
    );

  }

}
