import 'package:blood_donation_app/widgets/main_Appbar.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

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
    );
  }
}
