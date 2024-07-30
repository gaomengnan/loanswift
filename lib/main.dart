import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/presentation/views/board/boarding_page.dart';
import 'package:loanswift/features/presentation/views/index/index_page.dart';
import 'package:loanswift/theme/pallete.dart';

import 'features/presentation/bloc/bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<PhoneSenderBloc>(),
        ),
        BlocProvider(
          create: (_) => sl<AuthBloc>()
            ..add(
              LoadAuthTokenEvent(),
            ),
        ),
      ],
      // create: (_) => sl<PhoneSenderBloc>(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: const IndexPage(),
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // 设置国际化语言包
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: const Locale("zh"),
            title: "loan",
            theme: ThemeData(
              fontFamily: "Roboto",
              scaffoldBackgroundColor: Pallete.backgroundColor,
              colorScheme: ColorScheme.fromSeed(
                seedColor: Pallete.whiteColor,
              ),
              appBarTheme: const AppBarTheme(
                backgroundColor: Pallete.backgroundColor,
              ),
              useMaterial3: true,
            ),
            onGenerateRoute: generateRoute,
            home: child,
          );
        },
      ),
    );
  }
}
