import 'package:flutter/material.dart';

import 'colors.dart';

Widget defaultSpace = const SizedBox(
  height: 15,
);
Widget defaultHSpace = const SizedBox(
  width: 15,
);
Widget seperator = Container(
  height: 1,
  child: Expanded(
      child: Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    height: 3.5,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5), color: deviderColor),
  )),
);

Widget defaultButton = ElevatedButton(
  onPressed: () {},
  style: ElevatedButton.styleFrom(
    primary: Colors.blue,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.50), // Border radius here
    ),
  ),
  child: Text(
    'Click me!',
    style: TextStyle(fontSize: 16),
  ),
);
