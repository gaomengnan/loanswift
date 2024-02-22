import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/theme/pallete.dart';

import 'core/generated/l10n.dart';
import 'features/bloc/phone_sender_bloc.dart';
import 'features/presentation/board/boarding_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,],);
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (_) => sl<PhoneSenderBloc>(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: const BoardingPage(),
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
            title: 'Loanswift',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Pallete.whiteColor,
              ),
              textTheme: GoogleFonts.lateefTextTheme(textTheme).copyWith(
                bodyMedium: GoogleFonts.oswald(
                  textStyle: textTheme.bodyMedium,
                ),
              ),
              useMaterial3: true,
            ),
            onGenerateRoute: generateRoute,
            home: child,
            // home: const Center(
            //   child: Text("test"),
            // ),
          );
        },
      ),
    );
  }
}
