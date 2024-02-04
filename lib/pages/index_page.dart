import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/data/bottom_bar.dart';
import 'package:loanswift/pages/home_page.dart';
import 'package:loanswift/pages/person_page.dart';
import 'package:loanswift/theme/pallete.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

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
      // backgroundColor: Pallete.primaryColor,
      // appbar
      // appBar: AppBar(
      //
      //   toolbarHeight: 100.h,
      //   backgroundColor: Pallete.primaryColor,
      //   leading: Container(
      //     decoration: const BoxDecoration(
      //       shape: BoxShape.circle,
      //       color: Pallete.blueColor,
      //     ),
      //   ),
      // ),

      // 底部菜单
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 15.sp,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        showUnselectedLabels: true,
        selectedItemColor: Pallete.primaryColor,
        unselectedItemColor: Pallete.blackColor,
        items: List.generate(bars.length, (index) {
          return BottomNavigationBarItem(
            activeIcon: Icon(bars[index]["active_icon"]),
            icon: Icon(bars[index]["icon"]),
            label: bars[index]["title"],
          );
        }),
      ),
      body: pages[currentIndex],
    );
  }
}
