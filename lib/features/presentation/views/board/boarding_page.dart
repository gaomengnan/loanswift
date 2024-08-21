import 'package:flutter/material.dart';
import 'package:loanswift/core/constants/constants.dart';
import 'package:loanswift/main.dart';


class BoardingPage extends StatefulWidget {
  const BoardingPage({super.key});

  @override
  State<BoardingPage> createState() => _BoardingPageState();
}

class _BoardingPageState extends State<BoardingPage> {
  @override
  Widget build(BuildContext context) {
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

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      navigatorKey.currentState?.pushReplacementNamed('/index');
      //Navigator.pushReplacementNamed(context, "/index");
    });
  }
}
