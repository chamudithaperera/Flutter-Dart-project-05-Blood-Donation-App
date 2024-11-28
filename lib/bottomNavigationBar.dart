import 'package:blood_donation_app/AddDonationPage.dart';
import 'package:blood_donation_app/donationHistoryPage.dart';
import 'package:blood_donation_app/homePage.dart';
import 'package:blood_donation_app/locationPage.dart';
import 'package:blood_donation_app/qRPage.dart';
import 'package:flutter/material.dart';


class BloodHopeBottomNavigationBar extends StatefulWidget {
  const BloodHopeBottomNavigationBar({super.key});

  @override
  _BloodHopeBottomNavigationBarState createState() => _BloodHopeBottomNavigationBarState();
}

class _BloodHopeBottomNavigationBarState extends State<BloodHopeBottomNavigationBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const BloodHopeHomePage(),
    const LocationPage(),
    const QRCodePage(),
    const HistoryPage(),
    const AddDonationPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFD60030),
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'Location'),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: 'QR Code'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
        ],
      ),
    );
  }
}