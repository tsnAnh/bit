import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../models/domain/article.dart';
import '../../widgets/bit_circular_progress_bar.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key, required this.article}) : super(key: key);

  final Article article;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  var _isLoading = true;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.article.title),
      ),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Visibility(
              maintainAnimation: true,
              maintainSize: true,
              maintainState: true,
              visible: !_isLoading,
              child: WebView(
                javascriptMode: JavascriptMode.unrestricted,
                onPageFinished: (_) {
                  setState(() {
                    _isLoading = false;
                  });
                },
                initialUrl: widget.article.link,
              ),
            ),
            if (_isLoading)
              const BitCircularProgressBar(),
          ],
        ),
      ),
    );
  }
}
