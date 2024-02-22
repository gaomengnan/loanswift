import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/models/ticker.dart';
import '../features/bloc/bloc.dart';

final sl = GetIt.instance;

Future<void> initialize() async {
  final refs = SharedPreferences.getInstance();
  sl.registerFactory(
    () => PhoneSenderBloc(
      ticker: sl(),
    ),
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
