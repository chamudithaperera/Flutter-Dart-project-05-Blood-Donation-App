import 'package:flutter/material.dart';

import '../widgets/homePage/firstContainer.dart';
import '../widgets/homePage/fourthContainer.dart';
import '../widgets/main_Appbar.dart';
import '../widgets/homePage/secondContainer.dart';
import '../widgets/homePage/thirdContainer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: appBarLeading,
          title: appBarText,
          actions: getAppBarActions(context),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome!',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Text(
                          'User Name',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const FirstContainer(),
              const SecondContainer(),
              const ThirdContainer(),
              const FourthContainer(),
            ],
          ),
        ));
  }
}
