import 'package:flutter/material.dart';
import 'package:we_ready_app/presentation/core/service/route_service.dart';
import 'package:we_ready_app/presentation/core/service/theme_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'We Ready App',
      theme: ThemeService.currentTheme(context),
      onGenerateRoute: RouteService.generate,
    );
  }
}
