import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loanswift/theme/pallete.dart';

class CardScanner extends StatefulWidget {
  const CardScanner({super.key});

  @override
  State<CardScanner> createState() => _CardScannerState();
}

class _CardScannerState extends State<CardScanner> {
  late CameraController _controller;
  File? _imageFile;
  OverlayEntry? _overlayEntry;
  // late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // initializeCamera();
  }

  Future<void> initializeCamera() async {
    // 获取设备上可用的摄像头列表
    List<CameraDescription> cameras = await availableCameras();
    // 使用第一个摄像头
    _controller = CameraController(cameras[0], ResolutionPreset.medium);
    // 初始化controller
    await _controller.initialize();
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
      future: initializeCamera(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // 如果初始化完成，显示相机预览
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
                  left: 10.w,
                  // top: 20,
                  child: SafeArea(
                    child: GestureDetector(
                      onTap: (){
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.close,
                                      color: Colors.red,
                                    ),
                                    Icon(
                                      Icons.check,
                                      color: Colors.green,
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
                ),
              ],
            ),
          );
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
