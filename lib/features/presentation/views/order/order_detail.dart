import 'package:flutter/material.dart';
import 'package:loanswift/theme/theme.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({super.key});

  static const routerName = "/order_detail";

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
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
            elevation: 5.0,
            child: ListTile(
              title: Text('Order #123456'),
              subtitle: Text('Order Date: August 10, 2024'),
            ),
          ),
          Card(
            elevation: 5.0,
            child: ListTile(
              title: Text('Order #123456'),
              subtitle: Text('Order Date: August 10, 2024'),
            ),
          ),
          Card(
            elevation: 5.0,
            child: ListTile(
              title: Text('Order #123456'),
              subtitle: Text('Order Date: August 10, 2024'),
            ),
          ),
        ],
      ),
    );
  }
}
