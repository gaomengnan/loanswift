import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loanswift/features/data/datasource/auth.dart';
import 'package:loanswift/features/data/repository/auth.dart';
import 'package:loanswift/features/domain/repos/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/data/models/models.dart';
import '../features/presentation/bloc/bloc.dart';
import 'services/dio_client.dart';

final sl = GetIt.instance;

Future<void> initialize() async {
  // 本地存储
  final refs = await SharedPreferences.getInstance();
  // 网络检查
  final InternetConnectionChecker networkCheck =
      InternetConnectionChecker.createInstance(
    checkTimeout: const Duration(
      seconds: 5,
    ),
    checkInterval: const Duration(
      seconds: 1,
    ),
  );

  sl.registerFactory(
    () => PhoneSenderBloc(
      ticker: sl(),
      authRepo: sl(),
    ),
  );

  // bloc

  // datasource
  sl.registerLazySingleton<AuthDataSource>(
    () => AuthDataSourceImpl(
      sharedPreferences: sl(),
      dioClient: sl(),
    ),
  );

  // repo
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepository(
      sl(),
    ),
  );

  sl.registerFactory(
    () => AuthBloc(
      authRepo: sl(),
    ),
  );
  // auth-bloc

  sl.registerLazySingleton(
    () => DioClient(
      connectionChecker: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => const Ticker(),
  );
  sl.registerLazySingleton(
    () => refs,
  );

  sl.registerLazySingleton(
    () => networkCheck,
  );
}
