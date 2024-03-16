import 'package:adviser/domain/repositories/theme_repository.dart';
import 'package:flutter/foundation.dart';

abstract class ThemeService extends ChangeNotifier {
  late bool isDarkModeOn;
  late bool useSystemTheme;

  Future<void> toggleTheme();
  Future<void> setTheme({required bool mode});
  Future<void> init();

  Future<void> toggleUseSystemTheme();
  Future<void> setUseSystemTheme({required bool useSystemTheme});
}

class ThemeServiceImpl extends ChangeNotifier implements ThemeService {
  final ThemeRepository themeRepository;

  ThemeServiceImpl({required this.themeRepository});

  @override
  late bool isDarkModeOn = true;
  @override
  late bool useSystemTheme = true;

  @override
  Future<void> setTheme({required bool mode}) async {
    isDarkModeOn = mode;
    notifyListeners();
    await themeRepository.setThemeMode(mode: isDarkModeOn);
  }

  @override
  Future<void> toggleTheme() async {
    isDarkModeOn = !isDarkModeOn;
    await setTheme(mode: isDarkModeOn);
  }

  @override
  Future<void> setUseSystemTheme({required bool useSystemTheme}) async {
    useSystemTheme = useSystemTheme;
    notifyListeners();
    await themeRepository.setThemeMode(mode: useSystemTheme);
  }

  @override
  Future<void> toggleUseSystemTheme() async {
    useSystemTheme = !useSystemTheme;
    await setUseSystemTheme(useSystemTheme: useSystemTheme);
  }

  @override
  Future<void> init() async {
    final useSystemThemeOrFailure = await themeRepository.getUseSystemTheme();

    await useSystemThemeOrFailure.fold((failure) async {
      await setUseSystemTheme(useSystemTheme: false);
    }, (useSystemTheme) async {
      await setUseSystemTheme(useSystemTheme: true);
    });

    final modeOrFailure = await themeRepository.getThemeMode();

    modeOrFailure.fold((failure) {
      setTheme(mode: true);
    }, (mode) {
      setTheme(mode: mode);
    });
  }
}
