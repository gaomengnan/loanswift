import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/core/dio_client.dart';
import 'package:loanswift/core/event_bus_service.dart';
import 'package:loanswift/core/firebase_api.dart';
import 'package:loanswift/core/report.dart';
import 'package:loanswift/features/data/datasource/auth.dart';
import 'package:loanswift/features/data/datasource/common.dart';
import 'package:loanswift/features/data/datasource/home.dart';
import 'package:loanswift/features/data/datasource/order.dart';
import 'package:loanswift/features/data/datasource/report.dart';
import 'package:loanswift/features/data/repository/auth.dart';
import 'package:loanswift/features/data/repository/common.dart';
import 'package:loanswift/features/data/repository/home.dart';
import 'package:loanswift/features/data/repository/order.dart';
import 'package:loanswift/features/data/repository/report.dart';
import 'package:loanswift/features/domain/repos/auth.dart';
import 'package:loanswift/features/domain/repos/common.dart';
import 'package:loanswift/features/domain/repos/home.dart';
import 'package:loanswift/features/domain/repos/order.dart';
import 'package:loanswift/features/domain/repos/report.dart';
import 'package:loanswift/features/domain/usecases/authenticated/commit_certify.dart';
import 'package:loanswift/features/domain/usecases/authenticated/get_certifies.dart';
import 'package:loanswift/features/domain/usecases/authenticated/login.dart';
import 'package:loanswift/features/domain/usecases/authenticated/logout.dart';
import 'package:loanswift/features/domain/usecases/authenticated/send_phone_code.dart';
import 'package:loanswift/features/domain/usecases/common/data_report.dart';
import 'package:loanswift/features/domain/usecases/common/file_upload.dart';
import 'package:loanswift/features/domain/usecases/common/get_banks.dart';
import 'package:loanswift/features/domain/usecases/common/get_cities.dart';
import 'package:loanswift/features/domain/usecases/common/ocr.dart';
import 'package:loanswift/features/domain/usecases/common/report_fcm.dart';
import 'package:loanswift/features/domain/usecases/common/report_gps.dart';
import 'package:loanswift/features/domain/usecases/common/target_report.dart';
import 'package:loanswift/features/domain/usecases/home/data.dart';
import 'package:loanswift/features/domain/usecases/order/check_order.dart';
import 'package:loanswift/features/domain/usecases/order/get_order_detail.dart';
import 'package:loanswift/features/domain/usecases/order/order_confirm.dart';
import 'package:loanswift/features/domain/usecases/order/query_order.dart';
import 'package:loanswift/features/presentation/bloc/certify/certifies_bloc.dart';
import 'package:loanswift/features/presentation/bloc/home/home_bloc.dart';
import 'package:loanswift/features/presentation/bloc/order/order_bloc.dart';
import 'package:loanswift/firebase_options.dart';
import 'package:logger/web.dart';

import '../features/data/models/models.dart';
import '../features/presentation/bloc/bloc.dart';

final sl = GetIt.instance;
final EventBus bus = EventBus();

var logger = Logger(
  printer: PrettyPrinter(
    methodCount: 2, // Number of method calls to be displayed
    errorMethodCount: 8, // Number of method calls if stacktrace is provided
    lineLength: 120, // Width of the output
    colors: true, // Colorful log messages
    printEmojis: true, // Print an emoji for each log message
    dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
  ),
);

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
    ..registerFactory(
      () => HomeBloc(
        sl(),
      ),
    )
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
        //reportService: sl(),
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
    ..registerLazySingleton<ReportRepo>(
      () => ReportRepository(sl()),
    )
    ..registerLazySingleton<ReportDataSource>(
      () => ReportDataSourceImpl(dioClient: sl()),
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

  /* 获取设备信息 */

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
    ..registerFactory(() => CertifiesBloc(
        getCertifies: sl(),
        commitCertify: sl(),
        getCities: sl(),
        reportService: sl()))
    ..registerLazySingleton(() => GetCertifies(authRepo: sl()));

  /*  BUILD UPLOAD  */

  sl
    ..registerLazySingleton<ICommonDataSource>(
        () => CommonDataSource(dio: sl()))
    ..registerLazySingleton<ICommonService>(
        () => CommonRepositry(dataSource: sl()))
    ..registerLazySingleton(() => FileUpload(commonSer: sl()))
    ..registerLazySingleton(() => Ocr(commonService: sl()))
    ..registerLazySingleton(() => CommitCertify(authRepo: sl()))
    ..registerLazySingleton(() => GetCities(commonService: sl()))
    ..registerLazySingleton(() => GetBanks(commonService: sl()))
    ..registerLazySingleton(() => ReportService())
    ..registerLazySingleton(() => ReportFcm(reportRepo: sl()))
    ..registerLazySingleton(() => ReportLocation(reportRepo: sl()))
    ..registerLazySingleton(() => OrderConfim(order: sl()))
    ..registerLazySingleton(() => CheckOrder(order: sl()))
    ..registerLazySingleton(() => DataReport(reportRepo: sl()))
    ..registerLazySingleton(() => TargetReport(repo: sl()));

  try {
    final ReportService service = sl();

    if (Platform.isAndroid) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      await FirebaseApi().initNotifications();

      service.firebaseMessageTokenReport();
    }

    await service.getDeviceId();
    //service.gpsReport();
    await Geolocator.requestPermission();

    WidgetsBinding.instance.addObserver(bus);

    bus.onEvent();
  } catch (_) {}

  //EasyLoading.instance
  //  .indicatorType = EasyLoadingIndicatorType.pulse;
  EasyLoading.instance.indicatorType = EasyLoadingIndicatorType.pulse;
  //..loadingStyle = EasyLoadingStyle.custom // 使用自定义样式
  //..backgroundColor = Pallete.greyColor.withOpacity(.8) // 设置背景颜色
  //..indicatorColor = Colors.white // 指示器颜色
  //..textColor = Colors.white; // 文本颜色
}
