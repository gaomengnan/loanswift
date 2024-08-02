import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/core.dart';

import '../../../../core/common/widgets/widgets.dart';

class BuildBanner extends StatefulWidget {
  const BuildBanner({super.key});

  @override
  State<BuildBanner> createState() => _BuildBannerState();
}

class _BuildBannerState extends State<BuildBanner> {
  late PageController _pageController;
  int _currentIndex = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _pageController.addListener(
      () {
        final p = _pageController.page!;
        setState(() {
          _currentIndex = p.round();
        });
      },
    );
    super.initState();
  }

  Widget _buildBanner(int index) {
    final imageUrl = Assets.banners[index];
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.h),
      //height: ScreenUtil().screenHeight * 0.2,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(imageUrl),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(
        left: 10.h,
        right: 10.h,
        bottom: 5.h,
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            SizedBox(
              height: ScreenUtil().screenHeight * 0.2,
              child: PageView.builder(
                controller: _pageController,
                itemCount: Assets.banners.length,
                itemBuilder: (context, index) {
                  return _buildBanner(index);
                },
              ),
            ),
            Space(height: 5.h, width: 0),
            SizedBox(
              height: 10,
              child: Wrap(
                spacing: 10,
                children: [
                  ...List.generate(Assets.banners.length, (index) {
                    return AnimatedContainer(
                      duration: const Duration(
                        milliseconds: 150,
                      ),
                      height: 8.h,
                      width: _currentIndex == index ? 15.w : 8.w,
                      decoration: BoxDecoration(
                        color: _currentIndex == index
                            ? Colors.orangeAccent
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                        //shape: BoxShape.circle,
                      ),
                    );
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
