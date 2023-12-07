import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/colors.dart';
import '../constants/geometry.dart';
import '../data/const_data.dart';

class SideBar extends StatelessWidget {
  SideBar(
      {super.key,
      // required this.deviceheight,
      // required this.deviceMode,
      // required this.deviceWidth
      //required this.iconSize,
      required this.logoSize,
      required this.spaceBW,
      // r//equired this.scrollController,
      required this.listHeight});
  // double deviceheight;
  // int deviceMode;
  // double deviceWidth;
  double logoSize;
  double listHeight;
  double spaceBW;
  // ScrollController scrollController;
  // double iconSize;
  //double buttonSize;
//0 =>web, 1 =>phone
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: deviceheight,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/logo.png", width: logoSize, height: logoSize),
              defaultSpace,
              seperator,
              defaultSpace,
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(55),
                    border: Border.all(width: 3, color: profileRingColor)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(55),
                  child: Image.asset(
                    "assets/profile.jpg",
                    width: logoSize,
                    height: logoSize,
                  ),
                ),
              ),
              defaultSpace,
              Text(
                "Pooja Mishra",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
              ),
              defaultSpace,
              //button

              Container(
                width: logoSize,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.purple, width: 2)),
                child: Center(
                    child: Text(
                  "Admnin",
                  style: TextStyle(fontWeight: FontWeight.w600),
                )),
              ),
              defaultSpace,
              seperator,
              defaultSpace,
              SizedBox(
                height: listHeight,
                child: ListView.builder(
                    // controller: scrollController,
                    itemCount: sideMenuItems.length,
                    padding: EdgeInsets.all(0),
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Container(
                            decoration: i == 0
                                ? BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                    ),
                                    color: sidebarSelectedOptionColor)
                                : BoxDecoration(),
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 50),
                            margin: EdgeInsets.symmetric(vertical: 2.5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 25,
                                  height: 25,
                                  child: SvgPicture.asset(
                                    "assets/${sideMenuItems[i].image}",
                                    width: 25,
                                    height: 25,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(sideMenuItems[i].name)
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              defaultSpace,
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10, left: 50),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "WORKSPACE",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.add,
                      size: 20,
                    )
                  ],
                ),
              ),
              defaultSpace,
              Container(
                padding: EdgeInsets.only(left: 80, right: 25),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Adstacks"),
                        Icon(Icons.keyboard_arrow_down_rounded)
                      ],
                    ),
                    defaultSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Adstacks"),
                        Icon(Icons.keyboard_arrow_down_rounded)
                      ],
                    ),
                  ],
                ),
              ),

              defaultSpace
            ],
          ),
          SizedBox(
            height: spaceBW,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Row(
              children: [
                SvgPicture.asset("assets/Setting-line-light.svg"),
                SizedBox(
                  width: 20,
                ),
                Text("Setting")
              ],
            ),
          ),
          defaultSpace,
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Row(
              children: [
                SvgPicture.asset("assets/logout.svg"),
                SizedBox(
                  width: 20,
                ),
                Text("Setting")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
