import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loanswift/core/core.dart';
import 'package:loanswift/core/storage.dart';
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

  @override
  void initState() {
    super.initState();

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
    // 需要添加的参数
    var urlParams = {
      'token': tokenStr,
    };
    String urlWithParams = _buildUrlWithParams(widget.url, urlParams);

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            UI.showLoading();
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            _controller.runJavaScript('window.token = $tokenStr');
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            Future.delayed(const Duration(seconds: 1), () {
              UI.hideLoading();
            });
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
  String _buildUrlWithParams(String baseUrl, Map<String, String> params) {
    Uri uri = Uri.parse(baseUrl);
    Uri newUri =
        uri.replace(queryParameters: {...uri.queryParameters, ...params});
    return newUri.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
      ),
      body: SafeArea(
        child: WebViewWidget(
          controller: _controller,
        ),
      ),
    );
  }
}
