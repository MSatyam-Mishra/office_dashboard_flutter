import 'package:flutter/material.dart';

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
