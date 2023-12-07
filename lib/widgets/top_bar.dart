import 'package:flutter/material.dart';
import 'package:office_dashboard_flutter/screens/home_screen.dart';
import 'package:office_dashboard_flutter/widgets/search_widget.dart';

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
