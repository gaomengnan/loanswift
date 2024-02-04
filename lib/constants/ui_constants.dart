import 'package:flutter/material.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      // title: SvgPicture.asset(
      //   AssetsConstants.twitterLogo,
      //   colorFilter: const ColorFilter.mode(Pallete.blueColor, BlendMode.srcIn),
      //   // color: Pallete.blueColor,
      //   height: 30,
      // ),
      centerTitle: true,
    );
  }

  Text appText(String text) {
    return Text(
      text,
    );
  }

  static const List<Widget> bottomTabBarPages = [
    // TweetList(),
    // ExploreView(),
    // NotificationView(),
  ];
}
