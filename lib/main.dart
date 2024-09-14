import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/presentation/views/board/boarding_page.dart';
import 'package:loanswift/theme/theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'features/presentation/bloc/bloc.dart';

final navigatorKey = GlobalKey<NavigatorState>();


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /*  INIT */
  await initialize();

  //Worker().initial();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
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
                UI.showError(context, S.current.credit_login_expired);
                Future.delayed(const Duration(seconds: 2), (){
                  navigatorKey.currentState?.pushReplacementNamed('/auth');
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
                RefreshLocalizations.delegate,
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
