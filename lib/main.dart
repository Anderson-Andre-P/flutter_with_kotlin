import 'package:flutter/material.dart';
import 'package:flutter_with_kotlin/main_page.dart';

import 'custom_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: primaryBlack,
      ),
      home: const MainPage(),
    );
  }
}
