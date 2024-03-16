import 'package:adviser/application/advicer/advicer_bloc.dart';
import 'package:adviser/application/theme/theme_service.dart';
import 'package:adviser/injection.dart';
import 'package:adviser/presentation/advicer/adviser_page.dart';
import 'package:adviser/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  await di.sl<ThemeService>().init();

  runApp(ChangeNotifierProvider(
      create: (context) => di.sl<ThemeService>(), child: const MyAdviser()));
}

class MyAdviser extends StatelessWidget {
  const MyAdviser({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(
      builder: (context, themeService, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: true,
          title: 'Adviser',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeService.useSystemTheme
              ? ThemeMode.system
              : themeService.isDarkModeOn
                  ? ThemeMode.dark
                  : ThemeMode.light,
          home: BlocProvider(
            create: (context) => sl<AdvicerBloc>(),
            child: const AdviserPage(),
          ),
        );
      },
    );
  }
}
