import 'package:blood_donation_app/widgets/main_Appbar.dart';
import 'package:flutter/material.dart';

class GoogleMap extends StatefulWidget {
  const GoogleMap({super.key});

  @override
  State<GoogleMap> createState() => _GoogleMapState();
}

class _GoogleMapState extends State<GoogleMap> {
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
    );
  }
}
