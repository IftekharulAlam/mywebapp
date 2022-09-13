// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() => runApp(
      MaterialApp(
        home: MyApp(),
        theme: ThemeData(primarySwatch: Colors.purple),
      ),
    );

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controlleri = TextEditingController();
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();

  var urlString = "https://google.com";

  lauchUrl() {
    setState(() {
      urlString = controlleri.text;
      flutterWebviewPlugin.reloadUrl(urlString);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged wvs) {
      print(wvs.type);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
        appBar: AppBar(
          title: TextField(
            autofocus: false,
            controller: controlleri,
            cursorColor: Colors.white,
            cursorWidth: 0.3,
            textInputAction: TextInputAction.go,
            onSubmitted: (url) => lauchUrl(),
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Enter url Here",
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  lauchUrl();
                },
                icon: Icon(Icons.navigate_next))
          ],
        ),
        url: urlString,
        withZoom: false);
  }
}
