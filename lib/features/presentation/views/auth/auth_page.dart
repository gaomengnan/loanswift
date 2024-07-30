import 'package:flutter/material.dart';

import '../widgets/login_widget.dart';

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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [1.0],
                colors: [
                  Color.fromRGBO(167, 233, 241, 0.2),
                ],
              ),
            ),
          ),
          //backgroundColor: const Color.fromRGBO(167, 233, 241, 0.1),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            //stops: [0.0, 0.5],
            colors: [
              Color.fromRGBO(167, 233, 241, 0.2),
              Color.fromRGBO(167, 233, 241, 0.1),
            ],
          ),
        ),
        child: const LoginWidget(
          sourceName: "login",
        ),
      ),
    );
  }
}
