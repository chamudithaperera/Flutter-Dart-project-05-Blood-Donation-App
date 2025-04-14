import 'package:flutter/material.dart';
import '../google_map.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.3),
        title: const Text("Blood Donation Locations",
            style: TextStyle(color: Colors.black)),
      ),
      body: const GoogleMap(),
    );
  }
}
