import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:office_dashboard_flutter/constants/colors.dart';

import '../constants/geometry.dart';

class BirthdayWidget extends StatelessWidget {
  const BirthdayWidget(
      {super.key,
      required this.deviceWidth,
      required this.widgetWidth,
      required this.buttonWidth,
      required this.widgetHeight});

  final double deviceWidth;
  final double widgetWidth;
  final double widgetHeight;
  final double buttonWidth;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widgetWidth,
      height: widgetHeight,
      decoration: BoxDecoration(
        color: reminderCardColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Stack(children: [
        Positioned(left: 25, top: 5, child: Image.asset("assets/star48.png")),
        Positioned(right: 5, top: 25, child: Image.asset("assets/star48.png")),
        Positioned(
            left: 80,
            top: 20,
            child: Text(
              "Today Birthday",
              style: TextStyle(color: Colors.white),
            )),
        Positioned(
          top: 70,
          left: 30,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: reminderCardProfileRingColor),
                          shape: BoxShape.circle),
                      width: 50,
                      height: 50,
                      child: Image.asset("assets/boi.png")),
                  defaultHSpace,
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: reminderCardProfileRingColor),
                          shape: BoxShape.circle),
                      width: 50,
                      height: 50,
                      child: Image.asset("assets/girl_av.png")),
                ],
              ),
              defaultSpace,
              defaultSpace,
              Row(
                children: [
                  Text(
                    "Total",
                    style: TextStyle(color: reminderCardSubheadingColor),
                  ),
                  defaultHSpace,
                  Container(
                      height: 30, width: 3, color: reminderCardSubheadingColor),
                  defaultHSpace,
                  Text(
                    "2",
                    style: TextStyle(color: Colors.white),
                  ),
                  defaultHSpace,
                  Container(
                      height: 30, width: 3, color: reminderCardSubheadingColor),
                  defaultHSpace
                ],
              ),
              defaultSpace,
              defaultSpace,
            ],
          ),
        ),
        Positioned(
          top: 60,
          left: 60,
          child: SvgPicture.asset(
            "assets/birthday-cake.svg",
            width: 20,
            height: 20,
          ),
        ),
        Positioned(
          top: 60,
          left: 125,
          child: SvgPicture.asset(
            "assets/birthday-cake.svg",
            width: 20,
            height: 20,
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: Container(
            width: buttonWidth,
            padding: EdgeInsets.only(left: 25, right: 25, top: 7, bottom: 7),
            decoration: BoxDecoration(
                color: reminderCardButtonColor,
                borderRadius: BorderRadius.circular(10)),
            child: Row(children: [
              SvgPicture.asset(
                "assets/send.svg",
                color: Colors.white,
                width: 25,
                height: 25,
              ),
              defaultHSpace,
              Text(
                "Birthday Wishing",
                style: TextStyle(color: Colors.white),
              )
            ]),
          ),
        )
      ]),
    );
  }
}
