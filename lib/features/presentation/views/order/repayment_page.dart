import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/app_text.dart';
import 'package:loanswift/core/constants/constants.dart';
import 'package:loanswift/theme/pallete.dart';

class RepaymentPage extends StatelessWidget {
  const RepaymentPage({super.key});

  static const String routerName = '/repayment';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.secondaryColor,
      appBar: AppBar(
        backgroundColor: Pallete.whiteColor,
        title: const Text("贷款申请"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              color: Pallete.whiteColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),
                        AppText(
                          text: "付款金额",
                        ),
                        Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        )
                      ],
                    ),
                    UI.kHeight10(),
                    AppText(
                      size: 24.sp,
                      fontWeight: FontWeight.w900,
                      text: "600000",
                    ),
                    const Divider(
                      color: Colors.black12,
                      thickness: 5,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
