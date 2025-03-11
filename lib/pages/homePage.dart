import 'package:flutter/material.dart';

import '../widgets/main_Appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
        body: const Column());
  }
}
