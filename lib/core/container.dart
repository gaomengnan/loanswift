import 'package:get_it/get_it.dart';
import 'package:loanswift/features/data/datasource/auth.dart';
import 'package:loanswift/features/data/repository/auth.dart';
import 'package:loanswift/features/domain/repos/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/data/models/models.dart';
import '../features/presentation/bloc/bloc.dart';
import 'services/dio_client.dart';

final sl = GetIt.instance;

Future<void> initialize() async {
  final refs = await SharedPreferences.getInstance();
  sl.registerFactory(
    () => PhoneSenderBloc(
      ticker: sl(),
    ),
  );

  // bloc
  sl.registerLazySingleton(
    () => AuthDataSource(
      sharedPreferences: sl(),
      dioClient: sl(),
    ),
  );
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
    () => DioClient(),
  );
  sl.registerLazySingleton(
    () => const Ticker(),
  );
  sl.registerLazySingleton(
    () => refs,
  );
}
