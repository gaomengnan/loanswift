import 'package:flutter/material.dart';
import 'package:loanswift/core/common/widgets/my_appbar.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({super.key});
  static const routerName = "/my_order";

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BuildMyAppBar(
        title: "贷款记录",
      ),
    );
  }
}
