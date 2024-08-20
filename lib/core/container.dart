import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loanswift/core/device_info.dart';
import 'package:loanswift/core/dio_client.dart';
import 'package:loanswift/core/environment.dart';
import 'package:loanswift/core/firebase_api.dart';
import 'package:loanswift/features/data/datasource/auth.dart';
import 'package:loanswift/features/data/datasource/device.dart';
import 'package:loanswift/features/data/repository/auth.dart';
import 'package:loanswift/features/data/repository/device.dart';
import 'package:loanswift/features/domain/repos/auth.dart';
import 'package:loanswift/features/domain/repos/device.dart';
import 'package:loanswift/features/domain/usecases/authenticated/send_phone_code.dart';
import 'package:loanswift/firebase_options.dart';

import '../features/data/models/models.dart';
import '../features/presentation/bloc/bloc.dart';

final sl = GetIt.instance;

Future<void> initialize() async {
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

  /* CONTAINER INJECT */

  sl
    ..registerFactory(
      () => PhoneSenderBloc(
        ticker: sl(),
        sender: sl(),
      ),
    )
    ..registerLazySingleton(
      () => SendPhoneCodeUsecase(
        sl(),
      ),
    );

  // bloc

  // 注册登录相关
  sl
    ..registerFactory(
      () => AuthBloc(
        authRepo: sl(),
      ),
    )
    ..registerLazySingleton<AuthDataSource>(
      () => AuthDataSourceImpl(
        dioClient: sl(),
      ),
    )
    ..registerLazySingleton<AuthRepo>(
      () => AuthRepository(
        sl(),
      ),
    );

  sl
    ..registerLazySingleton<DeviceRepo>(
      () => DeviceRepository(
        sl(),
      ),
    )
    ..registerLazySingleton<DeviceDataSource>(
      () => DeviceDataSourceImpl(
        dioClient: sl(),
      ),
    );

  // 设备上传
  // auth-bloc

  sl
    ..registerLazySingleton(
      () => DioClient(
        connectionChecker: sl(),
      ),
    )
    ..registerLazySingleton(
      () => const Ticker(),
    )
    ..registerLazySingleton(
      () => networkCheck,
    );

  // END

  /* 获取设备信息 */

  final device = DeviceInfo(
    deviceRepo: sl(),
  );
  device.postDeviceInfo();

  /*   獲取 SMS*/
  device.readSMS();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  try {
    FirebaseApi().initNotifications();
  } catch (_) {}
}
