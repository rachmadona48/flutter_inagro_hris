import 'package:flutter/material.dart';
2
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';
3
import 'package:webviewapp/SecondPage.dart';
4
5
void main() => runApp(MyApp());
6
7
class MyApp extends StatelessWidget {
8
 // This widget is the root of your application.
9
 @override
10
 Widget build(BuildContext context) {
11
   return MaterialApp(
12
     title: 'Flutter Demo',
13
     theme: ThemeData(
14
       primarySwatch: Colors.blue,
15
     ),
16
     home: WebViewWebPage(),
17
   );
18
 }
19
}
20
21
class WebViewWebPage extends StatefulWidget {
22
 @override
23
 _WebViewWebPageState createState() => _WebViewWebPageState();
24
}
25
26
class _WebViewWebPageState extends State<WebViewWebPage> {
27
28
 Future<bool> _onBack() async {
29
   bool goBack;
30
   var value = await webView.canGoBack();  // check webview can go back
31
   if (value) {
32
     webView.goBack(); // perform webview back operation
33
     return false;
34
   } else {
35
     await showDialog(
36
       context: context,
37
       builder: (context) => new AlertDialog(
38
         title: new Text('Confirmation ', style: TextStyle(color: Colors.purple)),
39
         // Are you sure?
40
         content: new Text('Do you want exit app ? '),
41
         // Do you want to go back?
42
         actions: <Widget>[
43
           new FlatButton(
44
             onPressed: () {
45
               Navigator.of(context).pop(false);
46
               setState(() {
47
                 goBack = false;
48
               });
49
             },
50
             child: new Text(No), // No
51
           ),
52
           new FlatButton(
53
             onPressed: () {
54
               Navigator.of(context).pop();
55
               setState(() {
56
                 goBack = true;
57
               });
58
             },
59
             child: new Text(Yes), // Yes
60
           ),
61
         ],
62
       ),
63
     );
64
65
     if (goBack) Navigator.pop(context);   // If user press Yes pop the page
66
     return goBack;
67
   }
68
 }
69
70
71
 // URL to load
72
 var URL = "https://google.com.tr";
73
74
 var LISTENINGURL = "https://www.linkedin.com/in/omeryilmaz86/";
75
76
 // Webview progress
77
 double progress = 0;
78
 InAppWebViewController webView;
79
80
 @override
81
 Widget build(BuildContext context) {
82
   return WillPopScope(
83
     onWillPop: _onBack,
84
     child: Scaffold(
85
         appBar: AppBar(
86
           title: Text("Webview App"),
87
         ),
88
         body: Container(
89
             child: Column(
90
                 children: <Widget>[
91
           (progress != 1.0)
92
               ? LinearProgressIndicator(
93
                   value: progress,
94
                   backgroundColor: Colors.grey[200],
95
                   valueColor: AlwaysStoppedAnimation<Color>(Colors.purple))
96
               : null,    // Should be removed while showing
97
           Expanded(
98
             child: Container(
99
               child: InAppWebView(
100
                 initialUrl: URL,
101
                 initialHeaders: {},
102
                 initialOptions: {},
103
                 onWebViewCreated: (InAppWebViewController controller) {
104
                   webView = controller;
105
                 },
106
                 onLoadStart: (InAppWebViewController controller, String url) {
107
                   // Listen Url change
108
                   if(URL == LISTENINGURL){
109
                     Navigator.of(context, rootNavigator: true)
110
                         .push(MaterialPageRoute(
111
                         builder: (context) => new SecondPage()));
112
                   }
113
                 },
114
                 onProgressChanged:
115
                     (InAppWebViewController controller, int progress) {
116
                   setState(() {
117
                     this.progress = progress / 100;
118
                   });
119
                 },
120
               ),
121
             ),
122
           )
123
         ].where((Object o) => o != null).toList()))),
124
   );  //Remove null widgets
125
 }
126
}
127
128
129
class SecondPage extends StatelessWidget {
130
 @override
131
 Widget build(BuildContext context) {
132
   return Scaffold(
133
     appBar: AppBar(
134
       title: Text("Second Page"),
135
     ),
136
     body: Container(
137
       child: Center(
138
         child: Text("Hey,there!"),
139
       ),
140
     ),
141
   );
142
 }
143
}