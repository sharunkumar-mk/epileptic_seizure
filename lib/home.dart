import 'package:epileptic_seizure/about.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showProgress = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Epileptic Seizure Recognition'),

        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
            icon: Icon(Icons.info),
          ),
        ],
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri("https://epileptic-seizure-recognition.streamlit.app"),
        ),
        onWebViewCreated: (controller) {
          debugPrint("WebView Created");
        },

        onLoadStart: (controller, url) {
          setState(() {
            showProgress = false;
          });
          debugPrint("Loading started: $url");
        },

        onLoadStop: (controller, url) async {
          debugPrint("Loading finished: $url");
        },

        onProgressChanged: (controller, progress) {
          debugPrint("Loading progress: $progress%");
        },

        onConsoleMessage: (controller, consoleMessage) {
          debugPrint("Console: ${consoleMessage.message}");
        },
      ),
    );
  }
}
