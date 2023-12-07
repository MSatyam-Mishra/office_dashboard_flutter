import 'dart:io' show Platform;

import 'package:flexible_calendar/flexible_calendar.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:flutter/material.dart';

import 'package:office_dashboard_flutter/constants/colors.dart';

import '../constants/geometry.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../data/const_data.dart';
import '../widgets/anniversary_widget.dart';
import '../widgets/banner_widget.dart';
import '../widgets/birthday_widget.dart';
import '../widgets/calendar_widget.dart';
import '../widgets/chart.dart';
import '../widgets/creator_widget.dart';
import '../widgets/project_widget.dart';
import '../widgets/search_widget.dart';
import '../widgets/sidebar.dart';
import '../widgets/top_bar.dart';

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
                                // scrollController: _scrollController,
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
                              //   scrollController: _scrollController,
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
                                        BannerWidget(
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
                              BannerWidget(
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
