import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/common/widgets/widgets.dart';
import 'package:loanswift/core/constants/constants.dart';
import 'package:loanswift/theme/theme.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({super.key});

  static const routerName = "/order_detail";

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  Widget buildListTile(String k, String v) {
    return ListTile(
      title: AppText(
        size: 15.sp,
        fontWeight: FontWeight.w700,
        textAlign: TextAlign.start,
        text: k,
      ),
      trailing: AppText(
        size: 15.sp,
        fontWeight: FontWeight.w700,
        text: v,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallete.backgroundColor,
        title: const Text(
          "订单详情",
        ),
      ),
      body: ListView(
        children: [
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    textAlign: TextAlign.start,
                    text: "审查",
                    size: 20.sp,
                  ),
                  UI.kHeight5(),
                  AppText(
                    text: "asdadadadadadatext",
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 3,
            color: Colors.white,
            child: Column(
              children: [
                /*  
                    Application Logo And Name Desc 
                */

                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Color(0xffE3F4E6),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 0,
                    ),
                    leading: UI.squareContainer(
                      const Icon(
                        IconlyLight.buy,
                      ),
                    ),
                    title: AppText(
                      textAlign: TextAlign.start,
                      text: "应用程序",
                      fontWeight: FontWeight.w600,
                      size: 14.sp,
                    ),
                  ),
                ),

                /*
                   Application Detail Desc
                */

                /* 贷款日期 */

                buildListTile("贷款日期", "asdada"),

                /* 贷款金额 */

                buildListTile("贷款金额", "asdada"),

                /* 付款银行*/

                buildListTile("付款银行", "asdada"),

                /* 银行账号 */
                buildListTile(
                  "银行账号 ",
                  "asdada",
                ),
                /* 还款金额 */
                buildListTile(
                  "还款金额 ",
                  "asdada",
                ),
                /* 还款利息 */
                buildListTile(
                  "还款利息 ",
                  "asdada",
                ),
                /* 还款利息 */
                buildListTile(
                  "还款利息 ",
                  "asdada",
                ),
                /* 处理FOO */
                buildListTile(
                  "处理FOO",
                  "asdada",
                ),
                /* 迟交还款费用 */
                buildListTile(
                  "迟交还款费用",
                  "asdada",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
