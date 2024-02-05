import 'package:flutter/material.dart';
import 'package:loanswift/constants/assets.dart';
import 'package:loanswift/pages/index_page.dart';

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
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(
            seconds: 1,
          ),
          pageBuilder: (
            context,
            animation,
            secondaryAnimation,
          ) =>
              const IndexPage(),
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) {
            return FadeTransition(
              opacity: animation,
              // scale: animation,
              child: child,
            );
          },
        ),
      );
    });
  }
}
