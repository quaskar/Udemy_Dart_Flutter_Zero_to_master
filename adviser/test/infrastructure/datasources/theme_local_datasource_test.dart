import 'package:adviser/infrastructure/datasources/theme_local_datasource.dart';
import 'package:adviser/infrastructure/exceptions/exceptions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'theme_local_datasource_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late ThemeLocalDatasource themeLocalDatasource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    themeLocalDatasource =
        ThemeLocalDatasourceImpl(sharedPreferences: mockSharedPreferences);
  });

  group("getCacheThemeData", () {
    const tThemeData = true;

    test(
        "should return a bool (themedata) if there is one in sharedPerferences",
        () async {
      // arrange
      when(mockSharedPreferences.getBool(any)).thenReturn(tThemeData);

      // act
      final result = await themeLocalDatasource.getCachedThemeData();

      // assert
      verify(mockSharedPreferences.getBool(CACHED_THEME_MODE));
      expect(result, tThemeData);
    });

    test(
        "should return a CacheException if there is no data in sharedPerferences",
        () async {
      // arrange
      when(mockSharedPreferences.getBool(any)).thenReturn(null);

      // act
      final call = themeLocalDatasource.getCachedThemeData;

      // assert
      expect(() => call(), throwsA(const TypeMatcher<CacheException>()));
    });
  });

  group("cacheThemeData", () {
    const tThemeData = true;

    test("should call sharedPeferences to cache theme mode", () {
      // arrange
      when(mockSharedPreferences.setBool(any, any))
          .thenAnswer((_) async => true);

      // act
      themeLocalDatasource.cacheThemeData(mode: tThemeData);

      // assert
      verify(mockSharedPreferences.setBool(CACHED_THEME_MODE, tThemeData));
    });
  });
}
