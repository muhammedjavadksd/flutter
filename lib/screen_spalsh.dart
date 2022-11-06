
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart'; 
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/home.dart';
import 'package:shopping/intro.dart';



class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});



  @override
  Widget build(BuildContext context) {
    getPreference(context);
    return Scaffold(
      body: SafeArea(child: 
      
       Container(
        width: double.infinity,
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/icon_logo.png',width: 70,)
          ],

        ),
      )),
    );
  }

 void getPreference(BuildContext context) async
  {
    // final preference= await Sharedpreference.getInstance();
    final preference= await SharedPreferences.getInstance();
    final bool? intro= preference.getBool("intro");
    if(intro==true)
    {
      print("Preference True");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) =>  ScreenHome())));
    }else{
            print("Preference False");

      Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => const IntroSlider())));
    }
  }
}