import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/features/presentation/widgets/login_widget.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});
  static const routerName = "/auth";

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 50.sp,
        ),
        child: const LoginWidget(
          sourceName: "login",
        ),
      ),
    );
  }
}
