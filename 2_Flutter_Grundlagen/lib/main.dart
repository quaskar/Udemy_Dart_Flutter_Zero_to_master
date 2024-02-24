import 'package:flutter/material.dart';
import 'package:fluttergrundlagen/presentation/couter_app/counter_app_page.dart';
import 'package:fluttergrundlagen/presentation/navigation_example_screens/screen1.dart';
import 'package:fluttergrundlagen/presentation/navigation_example_screens/screen2.dart';
import 'package:fluttergrundlagen/presentation/widgets_examples/widgets_examples_page.dart';
import 'package:fluttergrundlagen/root.dart';
import 'package:fluttergrundlagen/theme.dart';
import 'package:provider/provider.dart';
import 'package:fluttergrundlagen/application/theme_service.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(
      builder: (context, themeService, child) {
        return MaterialApp(
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode:
              themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          routes: <String, WidgetBuilder>{
            "/root": (BuildContext context) => RootWidget(),
            "/screen1": (BuildContext context) => Screen1(),
            "/screen2": (BuildContext context) => Screen2(),
          },
          home: const RootWidget2(),
        );
      },
    );
  }
}
