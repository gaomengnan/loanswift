import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildBill extends StatelessWidget {
  const BuildBill({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 10.h,
      ),
      sliver: SliverToBoxAdapter(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          width: ScreenUtil().screenWidth,
          height: 200,
          decoration: const BoxDecoration(
            //color: Colors.redAccent,
            gradient: LinearGradient(colors: [
              Colors.redAccent,
              Colors.white,
            ]),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: Column(
            children: [
              const Flexible(
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  leading: Icon(Icons.payment),
                  title: Text('请尽快付款'),
                  trailing: Icon(Icons.arrow_right_alt),
                ),
              ),
              //UI.kHeight10(),
              Flexible(
                flex: 4,
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10.h,
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 10.h,
                  ),
                  width: ScreenUtil().screenWidth,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: const Text('1000'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
