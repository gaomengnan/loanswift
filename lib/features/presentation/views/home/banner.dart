import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';
import 'package:loanswift/features/domain/entity/entity.dart';
import 'package:loanswift/theme/theme.dart';


class BuildBanner extends StatefulWidget {
  final List<BannerEntity> banners;
  const BuildBanner({super.key, required this.banners});

  @override
  State<BuildBanner> createState() => _BuildBannerState();
}

class _BuildBannerState extends State<BuildBanner> {
  late PageController _pageController;
  int _currentIndex = 0;


  @override
    void dispose() {
      super.dispose();
      _pageController.dispose();
    }

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
    final banner = widget.banners[index];
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.h),
      //height: ScreenUtil().screenHeight * 0.2,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(banner.path),
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
                itemCount: widget.banners.length,
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
                  ...List.generate(widget.banners.length, (index) {
                    return AnimatedContainer(
                      duration: const Duration(
                        milliseconds: 150,
                      ),
                      height: 8.h,
                      width: _currentIndex == index ? 15.w : 8.w,
                      decoration: BoxDecoration(
                        color: _currentIndex == index
                            ? Pallete.secondaryColor
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
