import 'package:get_it/get_it.dart';
import 'package:loanswift/features/presentation/bloc/auth/auth_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/data/models/models.dart';
import '../features/presentation/bloc/bloc.dart';
import 'services/dio_client.dart';

final sl = GetIt.instance;

Future<void> initialize() async {
  final refs = SharedPreferences.getInstance();
  sl.registerFactory(
    () => PhoneSenderBloc(
      ticker: sl(),
    ),
  );
  sl.registerFactory(
    () => AuthBloc(),
  );

  sl.registerLazySingleton(
    () => DioClient(),
  );

  sl.registerLazySingleton(
    () => const Ticker(),
  );

  // sl.registerSingleton<PhoneSenderBloc>(
  //   PhoneSenderBloc(
  //     ticker: const Ticker(),
  //   ),
  // );

  sl.registerLazySingleton(
    () => refs,
  );
}
