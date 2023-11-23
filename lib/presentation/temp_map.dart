import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TempWebViewMap extends StatefulWidget {
  const TempWebViewMap({super.key});

  @override
  State<TempWebViewMap> createState() => _TempWebViewMapState();
}

class _TempWebViewMapState extends State<TempWebViewMap> {
  late final WebViewController controller;
  @override
  void initState() {

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {
            log('map initialization error ',error: error.description);
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://www.google.com/maps/@23.7983961,90.4219536,15z?entry=ttu'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
