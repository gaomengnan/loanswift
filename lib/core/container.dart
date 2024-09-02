import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/core/dio_client.dart';
import 'package:loanswift/core/firebase_api.dart';
import 'package:loanswift/features/data/datasource/auth.dart';
import 'package:loanswift/features/data/datasource/device.dart';
import 'package:loanswift/features/data/datasource/home.dart';
import 'package:loanswift/features/data/datasource/order.dart';
import 'package:loanswift/features/data/repository/auth.dart';
import 'package:loanswift/features/data/repository/device.dart';
import 'package:loanswift/features/data/repository/home.dart';
import 'package:loanswift/features/data/repository/order.dart';
import 'package:loanswift/features/domain/repos/auth.dart';
import 'package:loanswift/features/domain/repos/device.dart';
import 'package:loanswift/features/domain/repos/home.dart';
import 'package:loanswift/features/domain/repos/order.dart';
import 'package:loanswift/features/domain/usecases/authenticated/get_certifies.dart';
import 'package:loanswift/features/domain/usecases/authenticated/login.dart';
import 'package:loanswift/features/domain/usecases/authenticated/logout.dart';
import 'package:loanswift/features/domain/usecases/authenticated/send_phone_code.dart';
import 'package:loanswift/features/domain/usecases/home/data.dart';
import 'package:loanswift/features/domain/usecases/order/get_order_detail.dart';
import 'package:loanswift/features/domain/usecases/order/query_order.dart';
import 'package:loanswift/features/presentation/bloc/certify/certifies_bloc.dart';
import 'package:loanswift/features/presentation/bloc/home/home_bloc.dart';
import 'package:loanswift/features/presentation/bloc/order/order_bloc.dart';
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

  // BLOC
  // REPO DATASOURCE USERCASE
  sl
    ..registerFactory(() => HomeBloc(sl()))
    ..registerLazySingleton<HomeDataSource>(
      () => HomeDataImpl(dio: sl()),
    )
    ..registerLazySingleton<IHomeRepo>(
      () => HomeRepository(homeDataSource: sl()),
    )
    ..registerLazySingleton(
      () => GetHomeDataUseCase(repo: sl()),
    );

  sl
    ..registerFactory(
      () => PhoneSenderBloc(ticker: sl(), sender: sl()),
    )
    ..registerLazySingleton(
      () => SendPhoneCodeUseCase(sl()),
    );

  // bloc

  // 注册登录相关
  sl
    ..registerFactory(
      () => AuthBloc(
        useCase: sl(),
        logoutUseCase: sl(),
      ),
    )
    ..registerLazySingleton<AuthDataSource>(
      () => AuthDataSourceImpl(http: sl()),
    )
    ..registerLazySingleton<AuthRepo>(
      () => AuthRepository(sl()),
    )
    ..registerLazySingleton(
      () => LoginUseCase(sl()),
    )
    ..registerLazySingleton(
      () => LogoutUseCase(sl()),
    );

  sl
    ..registerLazySingleton<DeviceRepo>(
      () => DeviceRepository(sl()),
    )
    ..registerLazySingleton<DeviceDataSource>(
      () => DeviceDataSourceImpl(dioClient: sl()),
    );

  // 设备上传
  // auth-bloc

  sl
    ..registerLazySingleton(
      () => DioClient(
        connectionChecker: sl(),
        interceptor: DioInterceptor(),
      ),
    )
    ..registerLazySingleton(
      () => const Ticker(),
    )
    ..registerLazySingleton(
      () => networkCheck,
    );

  /*
  BUILD HOMEDDATA RELATE INSTANCE
  */

  /*   BUILD HOMEDDATA RELATE INSTANCE */

  // END

  /* 获取设备信息 */

  //final device = DeviceInfo(
  //  deviceRepo: sl(),
  //);
  //device.postDeviceInfo();

  /*   獲取 SMS*/
  //device.readSMS();

  /*  BUILD ORDER BLOC   */

  sl
    ..registerFactory(
      () => OrderBloc(
        queryOrderUseCase: sl(),
        getOrderDetailUseCase: sl(),
      ),
    )
    ..registerLazySingleton<IOrder>(
        () => OrderRepository(orderDataSource: sl()))
    ..registerLazySingleton<IOrderDataSource>(() => OrderDataSource(http: sl()))
    ..registerLazySingleton(() => QueryOrderUseCase(order: sl()))
    ..registerLazySingleton(() => GetOrderDetailUseCase(order: sl()));

  /*  BUILD ORDER BLOC END */

  /*   BUILD CERTIFIES BLOC */

  sl
    ..registerFactory(() => CertifiesBloc(getCertifies: sl()))
    ..registerLazySingleton(() => GetCertifies(authRepo: sl()));

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseApi().initNotifications();
  } catch (_) {}
}
