import 'package:flutter/rendering.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loanswift/core/device_info.dart';
import 'package:loanswift/core/dio_client.dart';
import 'package:loanswift/core/environment.dart';
import 'package:loanswift/features/data/datasource/auth.dart';
import 'package:loanswift/features/data/repository/auth.dart';
import 'package:loanswift/features/domain/repos/auth.dart';

import '../features/data/models/models.dart';
import '../features/presentation/bloc/bloc.dart';
import 'package:get_storage/get_storage.dart';

final sl = GetIt.instance;

Future<void> initialize() async {
  // 获取设备信息
  final device = DeviceInfo();
  final deviceInfo = await device.getDeviceDetails();

  debugPrint('Device info: $deviceInfo');

  await dotenv.load(
    fileName: Environment.fileName,
  );
  // 本地存储
  await GetStorage.init();
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
  //sl.registerLazySingleton(
  //  () => refs,
  //);

  sl.registerLazySingleton(
    () => networkCheck,
  );
}
