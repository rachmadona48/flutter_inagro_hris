import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';

import 'package:fluttertoast/fluttertoast.dart';

class Web_page extends StatelessWidget {
  DateTime backbuttonpressedTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: onWillPop,
        child: WebView(
          initialUrl: 'http://hris.inagro.co.id',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  } 

  Future<bool> onWillPop() async{
    DateTime currenTime = DateTime.now();

    bool backButton = backbuttonpressedTime == null || 
        currenTime.difference(backbuttonpressedTime) > Duration(seconds: 3);

    if (backButton){
      backbuttonpressedTime = currenTime;
      Fluttertoast.showToast(
        msg: "Tekan lagi untuk keluar",
        backgroundColor: Colors.black,
      );
      return false;
    }
    return true;
  }

  // Widget build(BuildContext context) {
  //   // return WebviewScaffold(
  //   //   url: 'http://hris.inagro.co.id',
  //   // );
  //   return Scaffold(
  //     // appBar: AppBar(title: Text("FAB on Webview")),
  //     // body: WebView(
  //     //   initialUrl: 'http://hris.inagro.co.id',
  //     //   javascriptMode: JavascriptMode.unrestricted,
  //     // ),
  //     // floatingActionButton: FloatingActionButton(
  //     //   onPressed: () {},
  //     //   // child: const Icon(Icons.refresh),
  //     // ),
  //     body: DoubleBackToCloseApp(
  //         child: WebView(
  //           initialUrl: 'http://hris.inagro.co.id',
  //           javascriptMode: JavascriptMode.unrestricted,
  //         ),
  //         snackBar: const SnackBar(
  //           content: Text('Tekan sekali lagi untuk keluar'),
  //         ),
  //       ),
  //   );
  // }


}