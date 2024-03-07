import 'package:flutter/material.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';
import 'package:loanswift/theme/theme.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({super.key});

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("个人信息"),
        centerTitle: true,
        backgroundColor: Pallete.primaryColor,
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/auth');
          },
          child: AppText(
            text: "登录/注册",
            color: Pallete.primaryColor,
          ),
        ),
      ),
    );
  }
}
