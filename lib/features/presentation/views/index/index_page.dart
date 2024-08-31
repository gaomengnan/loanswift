import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/presentation/bloc/home/home_bloc.dart';
import 'package:loanswift/theme/pallete.dart';

import '../home/home_page.dart';
import '../person/person_page.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  static const routerName = "/index";

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List pages = [
    BlocProvider(
      create: (context) => sl<HomeBloc>()..add(HomeStarupEvent()),
      child: const HomePage(),
    ),
    //const HomePage(),
    const PersonPage(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> bars = [
      {
        "title": S.current.home_button,
        "icon": IconlyLight.home,
        "active_icon": IconlyBold.home,
      },
      {
        "title": S.current.person_button,
        "icon": IconlyLight.user2,
        "active_icon": IconlyBold.user2,
      },
    ];
    return Scaffold(
      // 底部菜单
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 8.sp,
        selectedFontSize: 8.sp,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        showUnselectedLabels: true,
        selectedItemColor: Pallete.primaryColor,
        unselectedItemColor: Pallete.blackColor,
        items: List.generate(
          bars.length,
          (index) {
            final item = bars[index];
            return BottomNavigationBarItem(
              activeIcon: Icon(item["active_icon"]),
              icon: Icon(item["icon"]),
              label: item["title"],
            );
          },
        ),
      ),
      body: pages[currentIndex],
    );
  }
}
