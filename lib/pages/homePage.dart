import 'package:flutter/material.dart';

import '../widgets/firstContainer.dart';
import '../widgets/main_Appbar.dart';
import '../widgets/secondContainer.dart';

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
          backgroundColor: const Color(0xffffffff),
          elevation: 2, // Increases shadow depth
          shadowColor: Colors.black.withOpacity(0.3),
          leading: appBarLeading,
          title: appBarText,
          actions: appBarAction,
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              FirstContainer(),
              SecondContainer(),
            ],
          ),
        ));
  }
}
