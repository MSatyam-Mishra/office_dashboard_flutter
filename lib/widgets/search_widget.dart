import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:office_dashboard_flutter/constants/colors.dart';

import '../constants/geometry.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget(
      {super.key,
      required this.deviceWidth,
      required this.profileSize,
      required this.searchWidth});

  final double deviceWidth;
  final double searchWidth;
  final double profileSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: searchWidth,
          padding: EdgeInsets.only(left: 20, top: 7.5, bottom: 7.5, right: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: searchBarBgColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Search",
                style: TextStyle(color: searchTextColor),
              ),
              Icon(
                Icons.search_rounded,
                color: searchTextColor,
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
        defaultHSpace,
        Container(
          width: searchWidth,
          padding: EdgeInsets.only(right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset("assets/calendar-linear.svg"),
                  defaultHSpace,
                  SvgPicture.asset("assets/notification-outline.svg"),
                  defaultHSpace,
                  SvgPicture.asset("assets/poweroff.svg")
                ],
              ),
              Container(
                width: profileSize,
                height: profileSize,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: appBarProfileBGColor,
                    image:
                        DecorationImage(image: AssetImage("assets/boi.png"))),
              ),
            ],
          ),
        )
      ],
    );
  }
}
