import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/theme/pallete.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/common/widgets/widgets.dart';

class CardScanner2 extends StatefulWidget {
  const CardScanner2({super.key});

  @override
  State<CardScanner2> createState() => _CardScanner2State();
}

class _CardScanner2State extends State<CardScanner2> {
  late CameraController _controller;
  OverlayEntry? _overlayEntry;
  // late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // initializeCamera();
  }

  Future<void> initializeCamera(BuildContext context) async {
    // final bool granted = await Utils.checkCameraPermission();
    // if(!granted) {
    //
    //   throw Exception("");
    //
    //
    // }
    // 获取设备上可用的摄像头列表
    List<CameraDescription> cameras = await availableCameras();
    // 使用第一个摄像头
    _controller = CameraController(
      cameras[0],
      ResolutionPreset.medium,
    );
    // 初始化controller
    try {
      await _controller.initialize();
    } on CameraException catch (e) {
      if (context.mounted) {
        switch (e.code) {
          case "CameraAccessDenied":
            // showDialog(
            //   barrierDismissible: false,
            //   context: context,
            //   builder: (_) {
            //     return AlertDialog(
            //       elevation: 0,
            //       title: const Text("授权错误"),
            //       content: const Text(
            //           "权限获取失败"),
            //       actions: [
            //         TextButton(
            //           onPressed: () {
            //             Navigator.pushReplacement(
            //               context,
            //               MaterialPageRoute(
            //                 builder: (context) => const Identity(),
            //               ),
            //             );
            //           },
            //           child: const Text("OK"),
            //         )
            //       ],
            //     );
            //   },
            // );
            break;
          default:
        }

        // Utils.showInfo(
        //   context,
        //   "error: $e, code: ${e.code}",
        // );
      }
      rethrow;
    }
  }

  @override
  void dispose() {
    // 释放controller资源
    _controller.dispose();
    super.dispose();
  }

  void showSpinner() {
    OverlayState overlay = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height / 2 - 25,
        left: MediaQuery.of(context).size.width / 2 - 25,
        child: const SpinKitRotatingPlain(
          color: Colors.blue,
          size: 50.0,
        ),
      ),
    );

    overlay.insert(_overlayEntry!);
  }

  // 取消加载动画
  void hideSpinner() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeCamera(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            // Navigator.of(context).pop();
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              body: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.sentiment_very_dissatisfied,
                          color: Colors.red,
                        ),
                        UI.kWidth10(),
                        Text(
                          S.current.photo_permission_missing,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20.sp,
                          ),
                        ),
                      ],
                    ),
                    UI.kHeight10(),
                    OutlinedButton(
                      onPressed: () async {
                        await openAppSettings();
                      },
                      child: AppText(
                        text: S.current.click_to_access,
                        color: Pallete.blackColor,
                        size: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Scaffold(
              body: Stack(
                children: [
                  CameraPreview(_controller),
                  // 添加虚线遮罩
                  Align(
                    alignment: Alignment.center,
                    child: CustomPaint(
                      size: const Size(300, 200),
                      painter: DashedRectPainter(),
                    ),
                  ),
                  // 遮罩内的透明区域
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 280,
                      height: 180,
                      color: Colors.transparent,
                      child: const Center(
                        child: Text(
                          '请将身份证放在此区域',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  // 拍照按钮
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: FloatingActionButton(
                        child: const Icon(Icons.camera),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          // 如果初始化完成，显示相机预览
        } else {
          // 如果尚未完成，显示加载指示器
          return const Center(
            child: SpinKitRotatingPlain(
              color: Colors.blue,
              size: 50.0,
            ),
          );
        }
      },
    );
  }
}

class HolePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 绘制遮罩层
    Paint paint = Paint()..color = Colors.black.withOpacity(0.5);
    Rect fullScreenRect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(fullScreenRect, paint);

    // 镂空圆角长方形区域
    double horizontalMargin = 20.0;
    double rectWidth = size.width - 2 * horizontalMargin;
    double rectHeight = size.height / 3;
    RRect rRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        (size.width - rectWidth) / 2,
        (size.height - rectHeight) / 2,
        rectWidth,
        rectHeight,
      ),
      const Radius.circular(10), // 圆角大小
    );

    // 镂空处理
    var rectPath = Path()..addRRect(rRect);
    canvas.drawPath(rectPath, Paint()..blendMode = BlendMode.clear);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class DashedRectPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 5, dashSpace = 5;
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // 创建一个矩形路径
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    // 使用 PathMetrics 获取路径的度量信息
    for (PathMetric pathMetric in path.computeMetrics()) {
      double distance = 0.0;
      while (distance < pathMetric.length) {
        // 提取子路径
        Path extractPath =
            pathMetric.extractPath(distance, distance + dashWidth);
        canvas.drawPath(extractPath, paint);
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
