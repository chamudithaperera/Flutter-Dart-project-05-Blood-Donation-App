import 'package:blood_donation_app/bottomNavigationBar.dart';
import 'package:blood_donation_app/campaignsList.dart';
import 'package:blood_donation_app/donationTipsText.dart';
import 'package:blood_donation_app/statsWidgets.dart';
import 'package:flutter/material.dart';


class BloodHopeHomePage extends StatelessWidget {
  const BloodHopeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD60030),
        title: const Text(
          'BloodHope',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(
                  Icons.person,
                  color: Color(0xFFD60030),
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BloodHopeBottomNavigationBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome!',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Your Name',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16),
            StatsRow(),
            SizedBox(height: 24),
            Text(
              'Blood Donation Campaigns Near You',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 16),
            CampaignsList(),
            SizedBox(height: 24),
            Text(
              'Before Blood Donation',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            DonationTipsText(),
          ],
        ),
      ),
    );
  }
}