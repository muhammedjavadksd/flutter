import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScreenSignin extends StatelessWidget {
  const ScreenSignin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Color(0xffF2f2f2),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 20),
              child: Image.asset(
                "assets/images/icon_logo.png",
                width: 70,
              ),
            ),
            const Text("Log in",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700)),
            Padding(
              padding: const EdgeInsets.only(left: 2, right: 2),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 3, bottom: 3, right: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(250, 197, 181, 1),
                                borderRadius: BorderRadius.circular(5)),
                            child: const Padding(
                                padding: EdgeInsets.only(right: 8, left: 8),
                                child: Icon(Icons.email)),
                          )),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              width: 0, style: BorderStyle.none)),
                      hintText: "Enter username",
                      isDense: true,
                      contentPadding: EdgeInsets.all(20),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 9),
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Enter Password",
                    isDense: true,
                    contentPadding: EdgeInsets.all(20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(style: BorderStyle.none, width: 0),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, top: 3, right: 10, bottom: 3),
                      child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(250, 197, 181, 1),
                              borderRadius: BorderRadius.circular(5)),
                          child: const Padding(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            child: Icon(Icons.password),
                          )),
                    )),
              ),
            ),
            Container(
              width: double.infinity,
              child: const Padding(
                padding: EdgeInsets.only(left: 8, top: 5),
                child: Text(
                  "Forget Password?",
                  textAlign: TextAlign.left,
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFf77951),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  onPressed: () {},
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: const Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        "Sign In",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  )),
            ),
            Padding(padding: const EdgeInsets.only(top: 20), child: Text("Or")),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                            "assets/images/google.png",
                            width: 25,
                          ),
                        )),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          "assets/images/facebook.png",
                          width: 25,
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                Text("Didn't have an account? "),
                Text(" Start From Here",
                    style: const TextStyle(fontWeight: FontWeight.bold))
              ]),
            )
          ],
        ),
      )),
    );
  }
}
