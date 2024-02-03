import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:loanswift/theme/theme.dart';

void showInfo(BuildContext context, String message) {
  Flushbar(
    icon: Icon(
      Icons.info_outline,
      size: 28.0,
      color: Colors.blue[300],
    ),
    flushbarStyle: FlushbarStyle.FLOATING,
    borderRadius: BorderRadius.circular(20),
    flushbarPosition: FlushbarPosition.BOTTOM,
    message: message,
    duration: const Duration(seconds: 4),
  ).show(context);
}

void showSnakebar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
      content: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Pallete.redDeepColor,
              borderRadius: BorderRadius.circular(20),
            ),
            height: 100,
            child: Row(
              children: [
                const SizedBox(
                  width: 48,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.chat),
                          Text(
                            " 发生问题了",
                            style: TextStyle(
                              color: Pallete.whiteColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        content,
                        style: const TextStyle(
                          color: Pallete.whiteColor,
                          fontSize: 12,
                          // fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        // textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
