import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/home.dart';
import 'package:shopping/intro.dart';
import 'package:shopping/screen_spalsh.dart';
import 'package:shopping/sign_in.dart';
import 'package:shopping/sign_up.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.orange,
        fontFamily: "assets/font/mulish.ttf"
        ),
      home: ScreenHome(),
    );
  }
}
