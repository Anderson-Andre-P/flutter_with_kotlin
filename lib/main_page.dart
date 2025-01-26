import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_with_kotlin/custom_colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController textEditingController = TextEditingController();
  String resultText = "";
  static const MethodChannel channel = MethodChannel('uniqueChannelName');

  Future<void> callNativeCode() async {
    try {
      final String result = await channel.invokeMethod('userName');
      setState(() {
        resultText = result;
      });
    } catch (e) {
      debugPrint("Error when calling native code: $e");
    }
  }

  static const MethodChannel _channel = MethodChannel("uniqueChannelName");

  static Future<void> openNewScreen() async {
    try {
      await _channel.invokeMethod("openNewScreen");
    } catch (e) {
      log("Error opening new screen: $e");
    }
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Code"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MaterialButton(
              color: primaryBlack,
              textColor: Colors.white,
              child: const Text("Active Toast"),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              onPressed: callNativeCode,
            ),
            const SizedBox(height: 16),
            Text(resultText != "" ? resultText : ""),
            const SizedBox(height: 16),
            const MaterialButton(
              color: primaryBlack,
              textColor: Colors.white,
              child: Text("Open Kotlin Screen"),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              onPressed: openNewScreen,
            )
          ],
        ),
      ),
    );
  }
}
