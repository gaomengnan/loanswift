import 'package:flutter/material.dart';
import 'package:loanswift/core/constants/constants.dart';
import 'package:loanswift/core/storage.dart';
import 'package:loanswift/features/presentation/views/auth/auth_page.dart';
import 'package:loanswift/features/presentation/views/index/index_page.dart';
import 'package:loanswift/main.dart';

class BoardingPage extends StatelessWidget {
  const BoardingPage({super.key});

  @override
  Widget build(BuildContext context) {

    final token  = Storage.token;
      Future.delayed(const Duration(seconds: 2), () {
        if(token != null) {
          navigatorKey.currentState?.pushReplacementNamed(IndexPage.routerName);
        }else{
          navigatorKey.currentState?.pushReplacementNamed(AuthPage.routerName);
        }
      });

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Assets.onboardingBackground,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
