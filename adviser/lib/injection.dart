import 'package:adviser/application/advicer/advicer_bloc.dart';
import 'package:adviser/domain/usecases/advicer_usecases.dart';
import 'package:adviser/domain/repositories/advicer_repository.dart';
import 'package:adviser/infrastructure/datasources/advicer_remote_datasource.dart';
import 'package:adviser/infrastructure/repositories/advicer_repository_impl.dart';
import 'package:get_it/get_it.dart';

import 'package:http/http.dart' as http;

final sl = GetIt.I;

Future<void> init() async {
  //! Blocs
  sl.registerFactory(() => AdvicerBloc(usecases: sl()));

  //! Usecases
  sl.registerLazySingleton(() => AdvicerUsecases(advicerRepository: sl()));

  //! Repositories
  sl.registerLazySingleton<AdvicerRepository>(
      () => AdvicerRepositoryImpl(advicerRemoteDatasource: sl()));

  //! Remote Datasources
  sl.registerLazySingleton<AdvicerRemoteDatasource>(
      () => AdvicerRemoteDatasourceImpl(client: sl()));

  //! extern
  sl.registerLazySingleton(() => http.Client());
}
