import 'package:flutter/material.dart';
import 'package:go_green/helper/HelperColor.dart';

class WidgetBg extends StatelessWidget {
  Widget child;

  WidgetBg({required this.child});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(
          "assets/bg.png",
          fit: BoxFit.fill,
          width: width,
        ),
        SizedBox(
          height: height / 1.5,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: height / 1.5,
                decoration: kDecoration(HelperColor.colorLightGreen),
              ),
              Container(
                height: height / 1.55,
                decoration: kDecoration(HelperColor.colorGreen),
              ),
              Container(
                height: height / 1.6,
                decoration: kDecoration(Colors.white),
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      margin: const EdgeInsets.only(top: 40),
                      child: Image.asset("assets/topIcon.png"))),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset("assets/bottomIcon.png")),
              Align(alignment: Alignment.topCenter, child: child)
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: const EdgeInsets.only(top: 60),
            child: Image.asset(
              "assets/icon.png",
              color: Colors.white,
              height: 80,
            ),
          ),
        ),
      ],
    );
  }

  BoxDecoration kDecoration(Color color) {
    return BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)));
  }
}
