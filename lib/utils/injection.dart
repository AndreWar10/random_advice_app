import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:random_advice_app/presentation/bloc/bloc.dart';
import '../data/datasources/random_advice_remote_datasource.dart';
import '../data/repositories/random_advice_repository_implementation.dart';
import '../domain/repositories/random_advice_repository.dart';
import '../domain/usecases/get_random_advice.dart';

final getIt = GetIt.instance;

void init() {
  // repositories
  getIt.registerLazySingleton<RandomAdviceRepository>(
    () => RandomAdviceRepositoryImpl(adviceRemoteDataSource: getIt()),
  );

  // usecases
  getIt.registerLazySingleton(
    () => GetRandomAdvice(
      getIt(),
    ),
  );

  // datasources
  getIt.registerLazySingleton<RandomAdviceRemoteDataSource>(
    () => RandomAdviceRemoteDataSourceImpl(
      client: getIt(),
    ),
  );

  // // blocs
  getIt.registerLazySingleton(
    () => RandomAdviceBloc(
      getIt(),
    ),
  );

  // http
  getIt.registerLazySingleton(
    () => http.Client(),
  );
}
