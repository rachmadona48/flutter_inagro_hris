import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Web_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: 'http://hris.inagro.co.id',
      // url: 'https://kucingtekno.com',
      // hidden: true,
      // appBar: AppBar(title: Text("Webview")),
    );
  }
}