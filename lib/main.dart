import 'package:ecommerce_insights/config/theming/app_theme.dart';
import 'package:ecommerce_insights/features/metrics/presentation/screens/metrics_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Ecommerce Insights Example',
      theme:AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const MetricsScreen(),
    );
  }
}


