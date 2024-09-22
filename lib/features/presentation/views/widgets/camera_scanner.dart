import 'dart:io';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/theme/pallete.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image/image.dart' as img;

import '../../../../core/common/widgets/widgets.dart';

class CardScanner extends StatefulWidget {
  const CardScanner({super.key});

  @override
  State<CardScanner> createState() => _CardScannerState();
}

class _CardScannerState extends State<CardScanner> {
  late CameraController _controller;
  File? _imageFile;

  late final Future<void> _initCamera;

  @override
  void initState() {
    _initCamera = initializeCamera(context);
    //SystemChrome.setPreferredOrientations([
    //  DeviceOrientation.landscapeLeft,
    //  DeviceOrientation.landscapeRight,
    //]);
    super.initState();
    // initializeCamera();
  }

  Future<File> cropImage(File imageFile) async {
    final image = img.decodeImage(imageFile.readAsBytesSync());

    if (image == null) {
      throw Exception('Unable to decode image');
    }

    //final scaleX = image.width / imageSize.width;
    //final scaleY = image.height / imageSize.height;

    //final cropLeft = (cropRect.left * scaleX).toInt();
    //final cropTop = (cropRect.top * scaleY).toInt();
    //final cropWidth = (cropRect.width * scaleX).toInt();
    //final cropHeight = (cropRect.height * scaleY).toInt();

    final croppedImage = img.copyCrop(
      image,
      x: 40,
      y: 276,
      width: 280,
      height: 184,
    );

    final croppedFile = File('${imageFile.path}_cropped.jpg')
      ..writeAsBytesSync(img.encodeJpg(croppedImage));

    return croppedFile;
  }

  Future<void> initializeCamera(BuildContext context) async {
    await Permission.camera.request();
    List<CameraDescription> cameras = await availableCameras();
    // 使用第一个摄像头
    _controller = CameraController(
      cameras.first,
      ResolutionPreset.veryHigh,
    );
    // 初始化controller
    try {
      await _controller.initialize();
      await _controller.setFocusMode(FocusMode.auto);
    } on CameraException catch (e) {
      if (context.mounted) {
        switch (e.code) {
          case "CameraAccessDenied":
            break;
          default:
        }
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

  // 计算对准框在相机预览中的位置
  Rect getCropRect(Size screenSize) {
    double horizontalMargin = 40.0;
    double rectWidth = screenSize.width - 2 * horizontalMargin;
    double rectHeight = screenSize.height / 4;

    double left = (screenSize.width - rectWidth) / 2;
    double top = (screenSize.height - rectHeight) / 2;

    return Rect.fromLTWH(left, top, rectWidth, rectHeight);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initCamera,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            UI.showError(context, snapshot.error.toString());
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
                  if (_imageFile != null)
                    Positioned.fill(
                      bottom: 100.h,
                      child: Image.file(
                        _imageFile!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  if (_imageFile == null)
                    Positioned.fill(
                      bottom: 100.h,
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: CameraPreview(
                          _controller,
                        ),
                      ),
                    ),
                  if (_imageFile == null)
                    Center(
                      child: CustomPaint(
                        size: const Size(double.infinity, double.infinity),
                        painter: HolePainter(),
                      ),
                    ),
                  if (_imageFile == null)
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
                                      : Container(), // 显示拍照结果
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    try {
                                      // showSpinner();
                                      // await initializeCamera();

                                      // 拍照
                                      XFile file =
                                          await _controller.takePicture();

                                      final cropedImage =
                                          await cropImage(File(file.path));

                                      // 显示预览
                                      setState(() {
                                        _imageFile = cropedImage;
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
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      if (_imageFile != null)
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _imageFile = null;
                                            });
                                          },
                                          child: const Icon(
                                            Icons.close,
                                            color: Colors.red,
                                          ),
                                        ),
                                      if (_imageFile != null)
                                        const Icon(
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
          }
          // 如果初始化完成，显示相机预览
        } else {
          // 如果尚未完成，显示加载指示器
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.grey,
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
    // 打印或处理对焦区域的坐标和大小
    double x = rRect.left;
    double y = rRect.top;
    double width = rRect.width;
    double height = rRect.height;

    print('裁剪区域的左上角坐标: x = $x, y = $y');
    print('裁剪区域的大小: width = $width, height = $height');
    // 镂空处理
    var rectPath = Path()..addRRect(rRect);
    canvas.drawPath(rectPath, Paint()..blendMode = BlendMode.clear);
    _drawDashedRect(canvas, rRect, size);
  }

  void _drawDashedRect(Canvas canvas, RRect rRect, Size size) {
    double dashWidth = 5, dashSpace = 5;
    final paint = Paint()
      ..color = Colors.grey.withOpacity(0.3)
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
