import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widget/WidgetBg.dart';

enum EnumScreenType { SignIn, SignUp }

class ScreenLoginRegister extends StatefulWidget {
  EnumScreenType enumScreenType;
  ScreenLoginRegister({required this.enumScreenType});
  @override
  _ScreenLoginRegisterState createState() => _ScreenLoginRegisterState();
}

class _ScreenLoginRegisterState extends State<ScreenLoginRegister> {
  bool obsecureText = true;

  bool checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WidgetBg(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 60, bottom: 10),
                child: Text(
                  widget.enumScreenType == EnumScreenType.SignIn
                      ? "Welcome Back"
                      : "Create Your Account",
                  style: GoogleFonts.poppins(
                      fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ),
              if (widget.enumScreenType == EnumScreenType.SignUp)
                widgetFormTextField("Full Name", "Shubham Narkhede"),
              widgetFormTextField("Email", "shubham.narkhede8@gmail.com"),
              widgetFormTextField("Password", "Shubham",
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        obsecureText = !obsecureText;
                      });
                    },
                    child: Icon(
                      obsecureText
                          ? PhosphorIcons.eye
                          : PhosphorIcons.eye_closed,
                      color: Colors.black,
                    ),
                  ),
                  obsecureText: obsecureText),
              Container(
                margin: const EdgeInsets.only(top: 5, left: 35),
                child: Row(
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      margin: const EdgeInsets.only(right: 10),
                      child: Checkbox(
                          activeColor: Colors.green,
                          value: checkBoxValue,
                          onChanged: (onChanged) {
                            setState(() {
                              checkBoxValue = !checkBoxValue;
                            });
                          }),
                    ),
                    Text(
                      "I agree to terms and condition",
                      style: GoogleFonts.poppins(fontSize: 14),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 30, right: 30, top: 20, bottom: 20),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: 1,
                      color: Colors.grey,
                    )),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        "Or",
                        style: GoogleFonts.poppins(fontSize: 12),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      height: 1,
                      color: Colors.grey,
                    ))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 15),
                    child: socialLoginButton(Image.asset(
                      "assets/google.png",
                      height: 25,
                    )),
                  ),
                  socialLoginButton(const Icon(PhosphorIcons.apple_logo_fill)),
                ],
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    if (widget.enumScreenType == EnumScreenType.SignUp) {
                      widget.enumScreenType = EnumScreenType.SignIn;
                    } else {
                      widget.enumScreenType = EnumScreenType.SignUp;
                    }
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: widget.enumScreenType == EnumScreenType.SignUp
                            ? "Already have an account?"
                            : "Don't have an account?",
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: Colors.black)),
                    TextSpan(
                        text: widget.enumScreenType == EnumScreenType.SignUp
                            ? " Login"
                            : " Sign Up",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.green.shade800,
                            fontWeight: FontWeight.w700))
                  ])),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget widgetFormTextField(String title, String hintText,
      {Widget? suffixIcon, bool obsecureText = false}) {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 25, top: 10),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 5, left: 2),
                  child: const Icon(
                    Icons.star,
                    size: 10,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),
          TextField(
            obscureText: obsecureText,
            decoration: InputDecoration(
                hintText: hintText,
                suffixIcon: suffixIcon,
                hintStyle: GoogleFonts.poppins(color: Colors.grey),
                contentPadding:
                    const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                enabledBorder: outlineInputBorder(Colors.grey, 0.5),
                focusedBorder: outlineInputBorder(Colors.green, 1)),
          )
        ],
      ),
    );
  }

  OutlineInputBorder outlineInputBorder(Color color, double width) {
    return OutlineInputBorder(
        borderSide: BorderSide(width: width, color: color),
        borderRadius: BorderRadius.circular(40));
  }

  Widget socialLoginButton(Widget widget) {
    return Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(-2, 2), color: Colors.grey.shade300)
            ],
            borderRadius: BorderRadius.circular(6)),
        child: widget);
  }
}
