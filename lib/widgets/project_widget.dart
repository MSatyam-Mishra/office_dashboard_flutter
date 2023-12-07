import 'package:flutter/material.dart';
import 'package:office_dashboard_flutter/constants/geometry.dart';
import 'package:office_dashboard_flutter/data/const_data.dart';

import '../constants/colors.dart';

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({
    super.key,
    required this.deviceWidth,
    required this.widgetWidth,
    required this.scrollController,
    required this.widgetheight,
  });

  final double deviceWidth;
  final double widgetWidth;
  final ScrollController scrollController;
  final double widgetheight;

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(15),
      width: widgetWidth,
      height: widgetheight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: cardColor),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultSpace,
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "All Projects",
                style: TextStyle(color: Colors.white),
              ),
            ),
            defaultSpace,
            Container(
              height: 180,
              child: ListView.builder(
                  controller: scrollController,
                  itemCount: 3,
                  itemBuilder: (context, i) {
                    return Container(
                      decoration: BoxDecoration(
                          color: i == 0
                              ? cardSelectedOptionColor
                              : cardUnselectedOptionColor,
                          borderRadius: BorderRadius.circular(15)),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(
                          bottom: 10,
                          left: i == 0 ? 10 : 20,
                          right: i == 0 ? 10 : 20),
                      height: 60,
                      child: (Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            width: 30,
                            height: 30,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                projectImages[i],
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                "Technology behind the Blockchain",
                                style: TextStyle(color: Colors.white),
                              ),
                              Row(
                                children: [
                                  Text("Project #1",
                                      style: TextStyle(color: Colors.white)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.circle_sharp,
                                    size: 5,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "See project deatails",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.white),
                                  )
                                ],
                              )
                            ],
                          ),
                          Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 20,
                          )
                        ],
                      )),
                    );
                  }),
            )
          ]),
    );
  }
}
