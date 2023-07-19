import 'package:flutter/material.dart';
import 'package:go_green/helper/HelperColor.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widget/WidgetBg.dart';
import 'ScreenLoginRegister.dart';

class ScreenIntro extends StatefulWidget {
  @override
  _ScreenIntroState createState() => _ScreenIntroState();
}

class _ScreenIntroState extends State<ScreenIntro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WidgetBg(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 65),
              child: Image.asset(
                "assets/icon.png",
                height: 150,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 35, right: 35),
              child: Text(
                "Never forget to Go green everyday, because the green you add the higher you get",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, fontSize: 15),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ScreenLoginRegister(
                              enumScreenType: EnumScreenType.SignUp,
                            )));
              },
              child: Container(
                  height: 45,
                  margin: const EdgeInsets.only(left: 50, right: 50, top: 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      gradient: LinearGradient(colors: [
                        HelperColor.colorGreen,
                        HelperColor.colorLightGreen
                      ])),
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  )),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ScreenLoginRegister(
                              enumScreenType: EnumScreenType.SignIn,
                            )));
              },
              child: Container(
                  height: 45,
                  margin: const EdgeInsets.only(left: 50, right: 50, top: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      gradient: LinearGradient(colors: [
                        HelperColor.colorGreen,
                        HelperColor.colorLightGreen
                      ])),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                        child: Text(
                          "Sign In",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
