import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/home.dart';

class IntroSlider extends StatelessWidget {
  const IntroSlider({super.key});

  @override
  Widget build(BuildContext context) {
    var listPagesViewModel = [
      PageViewModel(
          image: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Image.asset(
              "assets/images/intro_1.png",
              width: double.infinity,
            ),
          ),
          title: "Choose Product",
          body:
              "A product is the item offered for sale. A product can be service or an item. it can be physical  or in virtual or cyber form",
          decoration: const PageDecoration(
              bodyTextStyle: TextStyle(fontSize: 17, height: 1.4))),
      PageViewModel(
          image: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Image.asset(
              "assets/images/intro_2.png",
              width: double.infinity,
            ),
          ),
          title: "Make Payment",
          body:
              "Make payment to confirm your oder, pay with secure payment gateway which we have implimente here.",
          decoration: const PageDecoration(
              bodyTextStyle: TextStyle(fontSize: 17, height: 1.4))),
      PageViewModel(
          image: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Image.asset(
              "assets/images/intro_3.png",
              width: double.infinity,
            ),
          ),
          title: "Explore More",
          body:
              "See all product and other categorys to explore what we have offered to you. simply buy any product you wish",
          decoration: const PageDecoration(
              bodyTextStyle: TextStyle(fontSize: 17, height: 1.4)))
    ];
    return Scaffold(
      body: SafeArea(
          child: IntroductionScreen(
        pages: listPagesViewModel,
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
        next: const Icon(Icons.skip_next),
        showBackButton: true,
        back: const Icon(Icons.arrow_back),
        onDone: () {
          setSharedPreference(context);
        },
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: Colors.indigo,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
      )),
    );
  }

  void setSharedPreference(BuildContext context) async {
    final preferenece = await SharedPreferences.getInstance();
    await preferenece.setBool("intro", true);
    print("Preference Set");
    Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => ScreenHome())));
  }

}
