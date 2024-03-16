import 'package:adviser/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ThemeRepository {
  Future<Either<Failure, bool>> getThemeMode();
  Future<Either<Failure, bool>> getUseSystemTheme();

  Future<void> setThemeMode({required bool mode});
  Future<void> setUseSystemTheme({required bool useSystemTheme});
}
