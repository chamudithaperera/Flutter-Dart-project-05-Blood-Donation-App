import 'package:blood_donation_app/widgets/main_Appbar.dart';
import 'package:flutter/material.dart';

class AddFilePage extends StatelessWidget {
  const AddFilePage({super.key});

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
