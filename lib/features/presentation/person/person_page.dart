import 'package:flutter/material.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({super.key});

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/auth');
            },
            child: const Text("登录/注册")),
      ),
    );
  }
}
