import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/presentation/views/board/boarding_page.dart';
import 'package:loanswift/theme/theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'features/presentation/bloc/bloc.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  runZonedGuarded(() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
      ],
    );
    /*  INIT */
    await initialize().then(
      (_) {},
    );
    //Worker().initial();

    await SentryFlutter.init(
      (opts) {
        opts.dsn =
            'https://4bcbede8124b3e94dec1df6237004e9a@o4508013720502272.ingest.us.sentry.io/4508013739704320';
        opts.tracesSampleRate = 1.0;
        opts.profilesSampleRate = 1.0;
      },
    );
    FlutterNativeSplash.remove();
    runApp(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<PhoneSenderBloc>(),
        ),
        BlocProvider(
          create: (_) => sl<AuthBloc>()..add(AppStarupEvent()),
        ),
      ],
      child: const MyApp(),
    ));
  }, (excepation, stackTrace) async {
    logger
        .e("runZonedGuarded excepation: $excepation, stackTrace: $stackTrace");
    await Sentry.captureException(excepation, stackTrace: stackTrace);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: const BoardingPage(),
      builder: (_, child) {
        return RefreshConfiguration(
          headerBuilder: () =>
              const WaterDropHeader(), // Configure the default header indicator. If you have the same header indicator for each page, you need to set this
          footerBuilder: () =>
              const ClassicFooter(), // Configure default bottom indicator
          headerTriggerDistance:
              80.0, // header trigger refresh trigger distance
          springDescription: const SpringDescription(
              stiffness: 170,
              damping: 16,
              mass:
                  1.9), // custom spring back animate,the props meaning see the flutter api
          maxOverScrollExtent:
              100, //The maximum dragging range of the head. Set this property if a rush out of the view area occurs
          maxUnderScrollExtent: 0, // Maximum dragging range at the bottom
          enableScrollWhenRefreshCompleted:
              true, //This property is incompatible with PageView and TabBarView. If you need TabBarView to slide left and right, you need to set it to true.
          enableLoadingWhenFailed:
              true, //In the case of load failure, users can still trigger more loads by gesture pull-up.
          hideFooterWhenNotFull:
              false, // Disable pull-up to load more functionality when Viewport is less than one screen
          enableBallisticLoad: true, //
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is LogoutSuccess) {
                //Navigator.of(context).pushNamed('/auth');
                //UI.showError(context, S.current.credit_login_expired);
                Future.delayed(const Duration(milliseconds: 100), () {
                  navigatorKey.currentState?.pushNamedAndRemoveUntil(
                    '/auth',
                    (Route<dynamic> route) => false,
                  );
                });
              }
            },
            child: MaterialApp(
              builder: EasyLoading.init(),
              navigatorKey: navigatorKey,
              debugShowCheckedModeBanner: false,
              // 设置国际化语言loan包
              localizationsDelegates: const [
                S.delegate,
                //RefreshLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              localeResolutionCallback: (locale, supportedLocales) {
                debugPrint(
                    "locale $locale, supported locales: $supportedLocales");
                return locale;
              },
              locale: const Locale("id"),
              title: "pintek",
              theme: AppTheme.theme,
              darkTheme: AppTheme.theme,
              onGenerateRoute: generateRoute,
              home: child,
            ),
          ),
        );
      },
    );
  }
}
