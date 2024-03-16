import 'package:adviser/application/advicer/advicer_bloc.dart';
import 'package:adviser/application/theme/theme_service.dart';
import 'package:adviser/domain/repositories/theme_repository.dart';
import 'package:adviser/domain/usecases/advicer_usecases.dart';
import 'package:adviser/domain/repositories/advicer_repository.dart';
import 'package:adviser/infrastructure/datasources/advicer_remote_datasource.dart';
import 'package:adviser/infrastructure/datasources/theme_local_datasource.dart';
import 'package:adviser/infrastructure/repositories/advicer_repository_impl.dart';
import 'package:adviser/infrastructure/repositories/theme_repository_impl.dart';
import 'package:get_it/get_it.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.I;

Future<void> init() async {
  //! application layer
  sl.registerFactory(() => AdvicerBloc(usecases: sl()));
  sl.registerLazySingleton<ThemeService>(
      () => ThemeServiceImpl(themeRepository: sl()));

  //! Usecases
  sl.registerLazySingleton(() => AdvicerUsecases(advicerRepository: sl()));

  //! Repositories
  sl.registerLazySingleton<AdvicerRepository>(
      () => AdvicerRepositoryImpl(advicerRemoteDatasource: sl()));
  sl.registerLazySingleton<ThemeRepository>(
      () => ThemeRepositoryImpl(themeLocalDatasource: sl()));

  //! Remote Datasources
  sl.registerLazySingleton<AdvicerRemoteDatasource>(
      () => AdvicerRemoteDatasourceImpl(client: sl()));

  sl.registerLazySingleton<ThemeLocalDatasource>(
      () => ThemeLocalDatasourceImpl(sharedPreferences: sl()));

  //! extern
  sl.registerLazySingleton(() => http.Client());
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
