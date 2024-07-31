import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/features/presentation/views/auth/auth_page.dart';
import 'package:loanswift/theme/pallete.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({super.key});

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  late ScrollController _scrollController;
  bool scrolled = false;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(initialScrollOffset: 0);
    _scrollController.addListener(() {
      setState(() {
        scrolled = _scrollController.offset > 100;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            backgroundColor: Pallete.primaryColor,
            floating: true,
            snap: true,
            pinned: true,
            expandedHeight: 100.0.h,
            //backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              titlePadding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
              title: scrolled
                  ? AppText(
                      text: "Welcome ~",
                      size: 20.sp,
                    )
                  : ListTile(
                      leading: const CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.blue,
                        child: Icon(
                          size: 30,
                          Icons.person_pin_circle_rounded,
                          color: Colors.white,
                        ),
                      ),
                      //tileColor: Colors.orange,
                      onTap: () {
                        Navigator.of(context).pushNamed(AuthPage.routerName);
                      },
                      title: Row(
                        children: [
                          AppText(
                            text: S.current.login_register,
                            size: 12.sp,
                            textAlign: TextAlign.start,
                            fontWeight: FontWeight.w600,
                          ),
                          const Icon(
                            Icons.arrow_right,
                          )
                        ],
                      ),
                    ),
            ),
          ),
          //SliverList(
          //  delegate: SliverChildBuilderDelegate(
          //    (BuildContext context, int index) {
          //      return ListTile(
          //        title: Text('Item #$index'),
          //      );
          //    },
          //    childCount: 50, // 列表项的数量
          //  ),
          //),
        ],
      ),
    );
  }
}
