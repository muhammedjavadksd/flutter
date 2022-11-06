import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScreenCartroot extends StatelessWidget {
  const ScreenCartroot({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: SafeArea(
          child: Center(
        child: Text("Cart"),
      )),
    );
  }
}
