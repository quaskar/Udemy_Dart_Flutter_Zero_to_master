import 'package:adviser/domain/failures/failures.dart';
import 'package:adviser/domain/repositories/theme_repository.dart';
import 'package:adviser/infrastructure/datasources/theme_local_datasource.dart';
import 'package:adviser/infrastructure/exceptions/exceptions.dart';
import 'package:adviser/infrastructure/repositories/theme_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'theme_repository_test.mocks.dart';

@GenerateMocks([ThemeLocalDatasource])
void main() {
  late ThemeRepository themeRepository;
  late MockThemeLocalDatasource mockThemeLocalDatasource;

  setUp(() {
    mockThemeLocalDatasource = MockThemeLocalDatasource();
    themeRepository =
        ThemeRepositoryImpl(themeLocalDatasource: mockThemeLocalDatasource);
  });

  group("setThemeMode", () {
    const tThemeMode = true;

    test("should call function to cache theme mode in local datasource", () {
      // arrange
      when(mockThemeLocalDatasource.cacheThemeData(mode: anyNamed("mode")))
          .thenAnswer((_) async => true);

      // act
      themeRepository.setThemeMode(mode: tThemeMode);

      // assert
      verify(mockThemeLocalDatasource.cacheThemeData(mode: tThemeMode));
    });
  });

  group("getThemeMode", () {
    const tThemeMode = true;

    test("should retrun them mode if cached data is present", () async {
      // arrange
      when(mockThemeLocalDatasource.getCachedThemeData())
          .thenAnswer((_) async => tThemeMode);

      // act
      final result = await themeRepository.getThemeMode();

      // assert
      expect(result, const Right(tThemeMode));
      verify(mockThemeLocalDatasource.getCachedThemeData());
      verifyNoMoreInteractions(mockThemeLocalDatasource);
    });

    test(
        "should retrun cache failure if local datasource throws a cached exception",
        () async {
      // arrange
      when(mockThemeLocalDatasource.getCachedThemeData())
          .thenThrow(CacheException());

      // act
      final result = await themeRepository.getThemeMode();

      // assert
      expect(result, Left(CacheFailure()));
      verify(mockThemeLocalDatasource.getCachedThemeData());
      verifyNoMoreInteractions(mockThemeLocalDatasource);
    });
  });
}
