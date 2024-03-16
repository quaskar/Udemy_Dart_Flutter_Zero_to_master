import 'package:adviser/application/theme/theme_service.dart';
import 'package:adviser/domain/failures/failures.dart';
import 'package:adviser/domain/repositories/theme_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'theme_service_test.mocks.dart';

@GenerateMocks([ThemeRepository])
void main() {
  late MockThemeRepository mockThemeRepository;
  late ThemeService themeService;
  late int listenerCount;

  setUp(() {
    listenerCount = 0;
    mockThemeRepository = MockThemeRepository();
    themeService = ThemeServiceImpl(themeRepository: mockThemeRepository)
      ..addListener(() {
        listenerCount++;
      });
  });

  test("check if default value for dark mode is true", () {
    // assert
    expect(themeService.isDarkModeOn, true);
  });

  group("setThemeMode", () {
    const tThemeMode = false;

    test(
        "should set theme to the paarmeter it gets and store theme information",
        () {
      // arrange
      themeService.isDarkModeOn = true;
      when(mockThemeRepository.setThemeMode(mode: anyNamed("mode")))
          .thenAnswer((_) async => true);

      // act
      themeService.setTheme(mode: tThemeMode);

      // assert
      expect(themeService.isDarkModeOn, tThemeMode);
      verify(mockThemeRepository.setThemeMode(mode: tThemeMode));
      expect(listenerCount, 1);
    });
  });

  group("toggleThemeMode", () {
    const tThemeMode = false;

    test("should toggle current theme and store theme information", () {
      // arrange
      themeService.isDarkModeOn = true;
      when(mockThemeRepository.setThemeMode(mode: anyNamed("mode")))
          .thenAnswer((_) async => true);

      // act
      themeService.toggleTheme();

      // assert
      expect(themeService.isDarkModeOn, tThemeMode);
      verify(mockThemeRepository.setThemeMode(mode: tThemeMode));
      expect(listenerCount, 1);
    });
  });

  group("init", () {
    const tThemeMode = false;

    test(
        "should get theme mode from local data source and use it to modify listers",
        () async {
      // arrange
      themeService.isDarkModeOn = true;
      when(mockThemeRepository.getThemeMode())
          .thenAnswer((_) async => const Right(tThemeMode));

      // act
      await themeService.init();

      // assert
      expect(themeService.isDarkModeOn, tThemeMode);
      verify(mockThemeRepository.getThemeMode());
      expect(listenerCount, 1);
    });

    test(
        "should strat with dark mode if no teme is retruned from local source and notify listeners",
        () async {
      // arrange
      themeService.isDarkModeOn = true;
      when(mockThemeRepository.getThemeMode())
          .thenAnswer((_) async => Left(CacheFailure()));

      // act
      await themeService.init();

      // assert
      expect(themeService.isDarkModeOn, true);
      verify(mockThemeRepository.getThemeMode());
      expect(listenerCount, 1);
    });
  });
}
