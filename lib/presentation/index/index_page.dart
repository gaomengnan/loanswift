import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/data/bottom_bar.dart';
import 'package:loanswift/presentation/home/home_page.dart';
import 'package:loanswift/theme/pallete.dart';

import '../person/person_page.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  static const routerName = "/index";

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List pages = [
    const HomePage(),
    const PersonPage(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 底部菜单
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 14.sp,
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
