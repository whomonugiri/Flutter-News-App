import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ReadMore extends StatefulWidget {
  final String pageurl;
  const ReadMore({this.pageurl = '', Key? key}) : super(key: key);

  @override
  _ReadMoreState createState() => _ReadMoreState();
}

class _ReadMoreState extends State<ReadMore> {
  var loading = 0;

  @override
  void initState() {
    // TODO: implement initState
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[400],
        title: Text('Go Back To News'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            WebView(
              onProgress: (progress) {
                setState(() {
                  loading = progress;
                });
              },
              initialUrl: widget.pageurl,
            ),
            loading == 100
                ? Stack()
                : LinearProgressIndicator(
                    color: Colors.red,
                    backgroundColor: Colors.black,
                    value: (loading / 100),
                  ),
          ],
        ),
      ),
    );
  }
}
