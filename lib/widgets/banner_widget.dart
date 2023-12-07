import 'package:flutter/material.dart';
import 'package:office_dashboard_flutter/constants/colors.dart';
import 'package:office_dashboard_flutter/constants/geometry.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget(
      {super.key,
      required this.deviceWidth,
      required this.topPadding,
      required this.textColumnWidth,
      required this.buttonWidth,
      required this.imageSize,
      required this.buttonPadding});

  final double deviceWidth;
  final double topPadding;
  final double textColumnWidth;
  final double buttonWidth;
  final double imageSize;
  final double buttonPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(vertical: topPadding, horizontal: topPadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
              colors: bannerGradientColor,
              begin: Alignment.bottomLeft,
              end: Alignment.topRight)),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: textColumnWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ethereum 2.0",
                    style: TextStyle(color: Colors.white),
                  ),
                  defaultSpace,
                  Text(
                    "Top Rating \nProject",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  defaultSpace,
                  Text(
                    "Trending project and high rating \nProject Created by team",
                    style: TextStyle(color: Colors.white),
                  ),
                  defaultSpace,
                  Container(
                    width: buttonWidth,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: bannerButtonColor),
                    padding: EdgeInsets.only(
                        left: buttonPadding, right: buttonPadding
                        // top:
                        //     deviceWidth * 0.015,
                        // bottom:
                        //     deviceWidth * 0.015,
                        ),
                    child: Center(
                        child: Text(
                      "Learn More.",
                      style: TextStyle(color: Colors.white),
                    )),
                  )
                ],
              ),
            ),
            Container(
              width: deviceWidth / 3.4,
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    right: 50,
                    top: 50,
                    child: Image.asset(
                        fit: BoxFit.fill,
                        "assets/3dfluid.png",
                        width: imageSize),
                  ),
                ],
              ),
            )
            // Image.asset(
            //     fit: BoxFit.fill, "assets/3dfluid.png", width: imageSize)
          ]),
    );
  }
}
