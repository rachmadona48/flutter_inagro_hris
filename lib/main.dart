import 'package:flutter/material.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'cek_koneksi.dart'; 

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Cek_koneksi(),
    );

    // return MaterialApp(
    //   home: Scaffold(
    //     body: DoubleBackToCloseApp(
    //       snackBar: const SnackBar(
    //         content: Text('Tap back again to close'),
    //       ),
    //       child: Cek_koneksi(),
    //     ),
    //   ),
    // );
  }
}