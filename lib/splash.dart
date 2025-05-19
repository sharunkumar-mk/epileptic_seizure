import 'dart:async';
import 'package:flutter/material.dart';
import 'package:epileptic_seizure/home.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String initText = 'Getting things ready…';
  double loadingData = 0.0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startFakeProgress();
  }

  void startFakeProgress() {
    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        loadingData += 0.05;
        if (loadingData >= 1.0) {
          loadingData = 1.0;
          timer.cancel();
          if (mounted) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const HomePage()),
            );
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/icons/logo.png", width: 100, height: 100),
                const SizedBox(height: 20),
                Text(
                  initText,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: 200,
                  child: LinearProgressIndicator(
                    value: loadingData,

                    backgroundColor: Colors.grey[300],
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
