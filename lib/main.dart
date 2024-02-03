import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: const Center(
        child: Text(""),
      ),
      builder: (_, child) {
        return MaterialApp(
          // title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
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
    );
  }
}
