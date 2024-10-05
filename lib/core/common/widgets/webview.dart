import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loanswift/core/storage.dart';
import 'package:loanswift/theme/pallete.dart';
import 'package:webview_flutter/webview_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:webview_flutter_android/webview_flutter_android.dart';
// ignore: depend_on_referenced_packages
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class WebViewComponent extends StatefulWidget {
  final String url;
  final String title;
  const WebViewComponent({
    super.key,
    required this.url,
    required this.title,
  });

  @override
  State<WebViewComponent> createState() => _WebViewComponentState();
}

class _WebViewComponentState extends State<WebViewComponent> {
  late final WebViewController _controller;
  double loadingPercentage = 0;

  @override
  void initState() {
    //loadingPercentage = 0;

    // #docregion platform_features
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features

    final token = Storage.token;

    String tokenStr = '';

    if (token != null) {
      tokenStr = token['token'].toString();
    }
    //// 需要添加的参数
    //var urlParams = {
    //  'token': tokenStr,
    //};
    //String urlWithParams = _buildUrlWithParams(widget.url, urlParams);
    String urlWithParams = widget.url;

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            setState(() {
              loadingPercentage = progress / 100;
            });
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            //setState(() {
            //  loadingPercentage = 0;
            //});
            _controller.runJavaScript('window.token = $tokenStr');
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            //setState(() {
            //  loadingPercentage = 100;
            //});
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
          ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
          onHttpError: (HttpResponseError error) {
            debugPrint('Error occurred on page: ${error.response?.statusCode}');
          },
          onUrlChange: (UrlChange change) {
            debugPrint('url change to ${change.url}');
          },
          onHttpAuthRequest: (HttpAuthRequest request) {
            //openDialog(request);
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..addJavaScriptChannel(
        "NATIVE",
        onMessageReceived: (JavaScriptMessage message) async {
          await ImagePicker().pickImage(source: ImageSource.gallery);
        },
      )
      ..loadRequest(Uri.parse(urlWithParams));

    // setBackgroundColor is not currently supported on macOS.
    if (kIsWeb || !Platform.isMacOS) {
      controller.setBackgroundColor(const Color(0x80000000));
    }

    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
      (controller.platform as AndroidWebViewController)
          .setOnShowFileSelector(_androidFilePicker);
    }
    // #enddocregion platform_features

    _controller = controller;
    super.initState();
  }

  Future<List<String>> _androidFilePicker(
      final FileSelectorParams params) async {
    final result = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (result != null) {
      final file = File(result.path);
      return [file.uri.toString()];
    }
    return [];
  }

  @override
  void dispose() {
    super.dispose();
  }

  // 构建带参数的 URL
  //String _buildUrlWithParams(String baseUrl, Map<String, String> params) {
  //  Uri uri = Uri.parse(baseUrl);
  //  Uri newUri =
  //      uri.replace(queryParameters: {...uri.queryParameters, ...params});
  //  return newUri.toString();
  //}

  Future<void> _canPop() async {
    final NavigatorState navigator = Navigator.of(context);
    if (await _controller.canGoBack()) {
      _controller.goBack();
    } else {
      navigator.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if(didPop) return;
        await _canPop();
        //if (await _controller.canGoBack()) {
        //  _controller.goBack();
        //  return;
        //}
        //return Future.value(true); // 允许返回 Flutter 页面
      },
      //onWillPop: () async {
      //  // 检查是否可以返回到上一网页
      //  if (await _controller.canGoBack()) {
      //    _controller.goBack();
      //    return Future.value(false); // 阻止返回，优先返回网页
      //  }
      //  return Future.value(true); // 允许返回 Flutter 页面
      //
      //},
      child: Scaffold(
        backgroundColor: Pallete.backgroundColor,
        appBar: AppBar(
          title: Text(
            widget.title,
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              WebViewWidget(
                controller: _controller,
              ),
              if (loadingPercentage < 1)
                LinearProgressIndicator(
                  value: loadingPercentage,
                  minHeight: 5,
                  color: Colors.grey,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
