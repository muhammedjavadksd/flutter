import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScreenAccountRoot extends StatelessWidget {
  const ScreenAccountRoot({super.key});

 @override
  Widget build(BuildContext context) {
    return  Container(
      child: SafeArea(
        child: Center(
          child: Text("Acccount"),
        )),
    );
  }
}