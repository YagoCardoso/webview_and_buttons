// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:app_profissionais_webview/widgets/floating_action_button.dart';
import 'package:app_profissionais_webview/widgets/footer.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:get/get.dart';

class Consulta5 extends StatefulWidget {
  const Consulta5({super.key});

  @override
  State<Consulta5> createState() => _Consulta5State();
}

class _Consulta5State extends State<Consulta5> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

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

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {
            debugPrint('WebView is Loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page Started Loading : $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page Finished Loading : $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
            Page Resource Error : 
            code : ${error.errorCode}
            description : ${error.description}
            errorType : ${error.errorType}
            isForMainFrame : ${error.isForMainFrame}
            ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://pub.dev/')) {
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          Get.snackbar('Navigate', message.message);
        },
      )
      ..loadRequest(
        Uri.parse('https://pub.dev/'),
      );

    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingAction(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      bottomNavigationBar: const PoweredBy(),
      extendBody: true,
      body: WebViewWidget(controller: _controller),
    );
  }
}
