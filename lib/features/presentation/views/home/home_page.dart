import 'package:flutter/material.dart';
import 'package:loanswift/features/presentation/views/home/appbar.dart';
import 'package:loanswift/features/presentation/views/home/banner.dart';
import 'package:loanswift/features/presentation/views/home/quota.dart';
import 'package:loanswift/features/presentation/views/home/suggestion.dart';
import 'package:loanswift/theme/app_theme.dart';
import 'package:loanswift/theme/pallete.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.theme.scaffoldBackgroundColor,
      resizeToAvoidBottomInset: true,
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Pallete.primaryColor,
                  Pallete.primaryColor,
                  Pallete.backgroundColor,
                ]),
          ),
          //height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: const CustomScrollView(
            slivers: [
              // Appbar
              BuildAppBar(),
              // banner
              BuildBanner(),
              // 查看额度
              BuildQuota(),
              // 借钱攻略
              BuildSuggestion(),
              //SliverFillRemaining(
              //  child: Text("asdsad"),
              //),
            ],
          )),
    );
  }
}



