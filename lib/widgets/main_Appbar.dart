import 'package:flutter/material.dart';
import '../pages/profilePage.dart';

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

List<Widget> getAppBarActions(BuildContext context) {
  return [
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProfilePage()),
          );
        },
        child: const Icon(
          Icons.account_circle,
          size: 30,
          color: Color(0xffD60033),
        ),
      ),
    )
  ];
}
