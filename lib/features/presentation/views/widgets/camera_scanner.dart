import 'dart:io';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/theme/pallete.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/common/widgets/widgets.dart';

class CardScanner extends StatefulWidget {
  const CardScanner({super.key});

  @override
  State<CardScanner> createState() => _CardScannerState();
}

class _CardScannerState extends State<CardScanner> {
  late CameraController _controller;
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    // initializeCamera();
  }

  Future<void> initializeCamera(BuildContext context) async {
    List<CameraDescription> cameras = await availableCameras();
    // 使用第一个摄像头
    _controller = CameraController(
      cameras.first,
      ResolutionPreset.medium,
    );
    // 初始化controller
    try {
      await _controller.initialize();
    } on CameraException catch (e) {
      if (context.mounted) {
        switch (e.code) {
          case "CameraAccessDenied":
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
                    //color: Colors.white,
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
                      child: RText(
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
                  Positioned.fill(
                    bottom: 100.h,
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: CameraPreview(
                        _controller,
                      ),
                    ),
                  ),
                  Center(
                    child: CustomPaint(
                      size: const Size(double.infinity, double.infinity),
                      painter: HolePainter(),
                    ),
                  ),
                  Positioned(
                    top: ScreenUtil().screenHeight / 2 - 10.h,
                    right: 0,
                    left: 0,
                    child: const Center(
                      child: Text(
                        "请将身份证放在此区域",
                        style: TextStyle(
                          color: Pallete.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10.w,
                    // top: 20,
                    child: SafeArea(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(
                          Icons.arrow_back,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.black,
                      ),
                      height: 100.h,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 40.h,
                                  width: 80.w,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(
                                      5.r,
                                    ),
                                  ),
                                  child: _imageFile == null
                                      ? Container() // 预览图片容器
                                      : Image.file(
                                          _imageFile!,
                                          fit: BoxFit.fitHeight,
                                        ), // 显示拍照结果
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    try {
                                      // showSpinner();
                                      // await initializeCamera();

                                      // 拍照
                                      XFile file =
                                          await _controller.takePicture();

                                      // 显示预览
                                      setState(() {
                                        _imageFile = File(file.path);
                                        // hideSpinner();
                                      });
                                    } catch (_) {}
                                  },
                                  child: Container(
                                    // margin: EdgeInsets.only(left: MediaQuery.of(context).size.width / 2 - 140 - 8 - 7),
                                    alignment: Alignment.center,
                                    height: 70.h,
                                    width: 70.w,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 4,
                                        color: Pallete.whiteColor,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40.h,
                                  width: 80.w,
                                  child: const Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      //Icon(
                                      //  Icons.close,
                                      //  color: Colors.red,
                                      //),
                                      //Icon(
                                      //  Icons.check,
                                      //  color: Colors.green,
                                      //),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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
            child: CircularProgressIndicator(
              color: Colors.blue,
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
    double horizontalMargin = 40.0;
    double rectWidth = size.width - 2 * horizontalMargin;
    double rectHeight = size.height / 4;
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
    _drawDashedRect(canvas, rRect, size);
  }

  void _drawDashedRect(Canvas canvas, RRect rRect, Size size) {
    double dashWidth = 5, dashSpace = 5;
    final paint = Paint()
      ..color = Pallete.primaryColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    Path path = Path()..addRRect(rRect);

    for (PathMetric pathMetric in path.computeMetrics()) {
      double distance = 0.0;
      while (distance < pathMetric.length) {
        final extractPath =
            pathMetric.extractPath(distance, distance + dashWidth);
        canvas.drawPath(extractPath, paint);
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
