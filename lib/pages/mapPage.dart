import 'package:flutter/material.dart';

import '../widgets/main_Appbar.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

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
      body: const Center(
        child: Text(
          'Map Page Content',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
