import 'package:flutter/material.dart';

Widget appBarLeading = const Padding(
  padding: EdgeInsets.all(10.0),
  child: Icon(
    Icons.menu,
    color: Color(0xffD60033),
    size: 30,
  ),
);

Widget appBarText = const Text(
  'BloodHope',
  style: TextStyle(
      color: Color(0xffD60033), fontWeight: FontWeight.w700, fontSize: 25),
);

List<Widget>? appBarAction = [
  const Padding(
    padding: EdgeInsets.all(10.0),
    child: Icon(
      Icons.account_circle,
      size: 30,
      color: Color(0xffD60033),
    ),
  )
];
