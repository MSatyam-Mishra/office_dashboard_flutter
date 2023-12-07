import 'dart:io' show Platform;

import 'package:flexible_calendar/flexible_calendar.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:flutter/material.dart';

import 'package:office_dashboard_flutter/constants/colors.dart';

import '../constants/geometry.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../data/const_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    bool drawer = false;
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceheight = MediaQuery.of(context).size.height;
    ScrollController _scrollController = ScrollController();
    bool isClicked = false;
    int selectedIndex = 0;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    Orientation deviceOrientation = MediaQuery.of(context).orientation;
    return Scaffold(
        key: _scaffoldKey,
        drawer: (kIsWeb || deviceOrientation == Orientation.landscape)
            ? Container()
            : (deviceWidth <= deviceWidth * 0.4 ||
                    ((Platform.isAndroid || Platform.isIOS) &&
                        deviceOrientation == Orientation.portrait))
                ? SafeArea(
                    child: Drawer(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 25),
                          child: SizedBox(
                            height: deviceheight,
                            width: deviceWidth * 0.7,
                            child: SideBar(
                                logoSize: deviceWidth / 4,
                                spaceBW: 15,
                                scrollController: _scrollController,
                                listHeight: deviceheight / 3),
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
        body: (kIsWeb || deviceOrientation == Orientation.landscape)
            ? SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                controller: _scrollController,
                child: Container(
                    width: deviceWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //sidebar
                        Container(
                            color: sidebarBG,
                            width: deviceWidth * 0.22,
                            child: SideBar(
                              scrollController: _scrollController,
                              logoSize: deviceWidth * 0.06,
                              listHeight: deviceheight * 0.4,
                              spaceBW: 60,
                            )),
                        //body+right
                        Container(
                          color: sidebarSelectedOptionColor,
                          //height: deviceheight,
                          width: deviceWidth - deviceWidth * 0.22,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: deviceWidth - deviceWidth * 0.22,
                                height: deviceWidth * 0.06,
                                child: TopBar(
                                  deviceWidth: deviceWidth,
                                  profileSize: deviceWidth * 0.03,
                                  searchWidth: deviceWidth * 0.22,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //body
                                  Container(
                                    padding: EdgeInsets.only(
                                        right: deviceWidth * 0.0123,
                                        left: deviceWidth * 0.0123),
                                    width: deviceWidth * 0.56,
                                    child: Column(
                                      children: [
                                        Banner(
                                          deviceWidth: deviceWidth,
                                          buttonWidth:
                                              (deviceWidth * 0.17) / 1.5,
                                          imageSize: (deviceWidth * 0.56) / 4,
                                          topPadding: deviceWidth * 0.025,
                                          textColumnWidth: deviceWidth * 0.17,
                                          buttonPadding: deviceWidth * 0.019,
                                        ),
                                        defaultSpace,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            //project
                                            ProjectWidget(
                                                widgetheight: 250,
                                                scrollController:
                                                    _scrollController,
                                                widgetWidth:
                                                    (deviceWidth * 0.56) / 2 -
                                                        deviceWidth * 0.017,
                                                deviceWidth: deviceWidth),
                                            CreatorWidget(
                                                widgetHeight: 250,
                                                scrollController:
                                                    _scrollController,
                                                widgetWidth:
                                                    (deviceWidth * 0.56) / 2 -
                                                        deviceWidth * 0.017,
                                                deviceWidth: deviceWidth)
                                            //creator
                                          ],
                                        ),
                                        defaultSpace,
                                        Chart(deviceWidth: deviceWidth)
                                      ],
                                    ),
                                  ),

                                  //right side
                                  Container(
                                    width: deviceWidth * 0.22,
                                    color: cardColor,
                                    //  height: deviceheight,
                                    padding:
                                        EdgeInsets.all(deviceWidth * 0.0125),
                                    child: Column(
                                      children: [
                                        Text(
                                          "GENERAl 10:00 AM To 7:00 PM ",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        defaultSpace,
                                        CalendarWidget(
                                            widgetWidth: deviceWidth * 0.22,
                                            deviceWidth: deviceWidth),
                                        defaultSpace,
                                        BirthdayWidget(
                                            buttonWidth: deviceWidth * 0.16,
                                            widgetHeight: deviceWidth * 0.19,
                                            widgetWidth: deviceWidth * 0.22,
                                            deviceWidth: deviceWidth),
                                        defaultSpace,
                                        AnniversaryWidget(
                                            buttonWidth: deviceWidth * 0.17,
                                            widgetHeight: deviceWidth * 0.19,
                                            widgetWidth: deviceWidth * 0.22,
                                            deviceWidth: deviceWidth)
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
              )
            : (deviceWidth <= deviceWidth * 0.4 ||
                    ((Platform.isAndroid || Platform.isIOS) &&
                        deviceOrientation == Orientation.portrait))
                ? Container(
                    width: deviceWidth,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SafeArea(
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // controller: _scrollController,

                            children: [
                              GestureDetector(
                                onTap: () {
                                  _scaffoldKey.currentState?.openDrawer();
                                },
                                child: Image.asset(
                                  "assets/logo.png",
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                              SearchWidget(
                                deviceWidth: deviceWidth,
                                searchWidth: deviceWidth / 1.8 - 40,
                                profileSize: 30,
                              ),
                              defaultSpace,
                              Banner(
                                buttonPadding: 10,
                                buttonWidth: deviceWidth / 3,
                                deviceWidth: deviceWidth,
                                imageSize: deviceWidth / 4,
                                textColumnWidth: deviceWidth / 2,
                                topPadding: 10,
                              ),
                              defaultSpace,
                              Container(
                                  width: deviceWidth,
                                  child: Chart(deviceWidth: deviceWidth)),
                              defaultSpace,
                              ProjectWidget(
                                widgetheight: 300,
                                scrollController: _scrollController,
                                deviceWidth: deviceWidth,
                                widgetWidth: deviceWidth,
                              ),
                              defaultSpace,
                              CreatorWidget(
                                widgetHeight: 250,
                                scrollController: _scrollController,
                                deviceWidth: deviceWidth,
                                widgetWidth: deviceWidth,
                              ),
                              defaultSpace,
                              CalendarWidget(
                                deviceWidth: deviceWidth,
                                widgetWidth: deviceWidth,
                              ),
                              defaultSpace,
                              BirthdayWidget(
                                buttonWidth: deviceWidth / 2,
                                widgetHeight: 250,
                                deviceWidth: deviceWidth,
                                widgetWidth: deviceWidth,
                              ),
                              defaultSpace,
                              AnniversaryWidget(
                                buttonWidth: deviceWidth / 1.8,
                                widgetHeight: 250,
                                deviceWidth: deviceWidth,
                                widgetWidth: deviceWidth,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : Container() //mobile
        //pc web
        );
  }
}

class AnniversaryWidget extends StatelessWidget {
  const AnniversaryWidget({
    super.key,
    required this.deviceWidth,
    required this.widgetWidth,
    required this.widgetHeight,
    required this.buttonWidth,
  });

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
              "Anniversary",
              style: TextStyle(color: Colors.white),
            )),
        Positioned(
          top: 70,
          left: 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    "3",
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
                "Anniversary Wishing",
                style: TextStyle(color: Colors.white),
              )
            ]),
          ),
        )
      ]),
    );
  }
}

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

class CalendarWidget extends StatelessWidget {
  const CalendarWidget(
      {super.key, required this.deviceWidth, required this.widgetWidth});

  final double deviceWidth;
  final double widgetWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widgetWidth,
      //height: deviceWidth * 0.22,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: FlexibleCalendarView(
        textPreMonthTitle: "Dec",
        decorationOfSelectedDay: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        colorDayInAnotherMonth: Colors.grey,
        borderBackgroundStartDay: BorderRadius.only(
            topLeft: Radius.circular(25), bottomLeft: Radius.circular(25)),
        borderBackgroundEndDay: BorderRadius.only(
            topRight: Radius.circular(25), bottomRight: Radius.circular(25)),
        isSelectedOnlyOneDay: false,
        colorOfDayInMonth: Colors.black,
        colorOfSelectedDay: Colors.purple,
        styleOfDay: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class Chart extends StatelessWidget {
  const Chart({
    super.key,
    required this.deviceWidth,
  });

  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: deviceWidth * 0.56,
        // height: 250,
        child: Image.asset(
          "assets/chart.png",
          fit: BoxFit.cover,
        ));
  }
}

class CreatorWidget extends StatelessWidget {
  CreatorWidget(
      {super.key,
      required this.deviceWidth,
      required this.widgetWidth,
      required this.widgetHeight,
      required this.scrollController});
  double deviceWidth;
  double widgetWidth;
  ScrollController scrollController;
  double widgetHeight;
  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(15),
      width: widgetWidth,
      height: widgetHeight,
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
                "Top Creators",
                style: TextStyle(color: Colors.white),
              ),
            ),
            defaultSpace,
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Name",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Artworks",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Rating",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            Container(
              height: 180 - 30,
              child: ListView.builder(
                  controller: scrollController,
                  itemCount: 3,
                  itemBuilder: (context, i) {
                    return Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 5, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration:
                                      BoxDecoration(shape: BoxShape.circle),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image.asset(
                                        fit: BoxFit.fill,
                                        "assets/${creatorList[i].image}"),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  creatorList[i].id,
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  creatorList[i].artworks.toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: (BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: baseRatingbarColor)),
                                  width: 28,
                                  height: 6,
                                ),
                                Container(
                                    margin: EdgeInsets.only(right: 10),
                                    width: i == 0
                                        ? 25
                                        : i == 1
                                            ? 20
                                            : i == 2
                                                ? 23
                                                : 22,
                                    height: 6,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: cardRatingBarColor))
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ]),
    );
  }
}

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

class Banner extends StatelessWidget {
  const Banner(
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

class TopBar extends StatelessWidget {
  const TopBar(
      {super.key,
      required this.deviceWidth,
      required this.profileSize,
      required this.searchWidth});

  final double deviceWidth;
  final double searchWidth;
  final double profileSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: deviceWidth * 0.03),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text("Home"),
        Row(
          children: [
            SearchWidget(
              deviceWidth: deviceWidth,
              profileSize: profileSize,
              searchWidth: searchWidth,
            ),
          ],
        ),
      ]),
    );
  }
}

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

class SideBar extends StatelessWidget {
  SideBar(
      {super.key,
      // required this.deviceheight,
      // required this.deviceMode,
      // required this.deviceWidth
      //required this.iconSize,
      required this.logoSize,
      required this.spaceBW,
      required this.scrollController,
      required this.listHeight});
  // double deviceheight;
  // int deviceMode;
  // double deviceWidth;
  double logoSize;
  double listHeight;
  double spaceBW;
  ScrollController scrollController;
  // double iconSize;
  //double buttonSize;
//0 =>web, 1 =>phone
  @override
  Widget build(BuildContext context) {
    return Container(
      /// height: deviceheight,
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
                    controller: scrollController,
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
