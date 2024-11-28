import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donation History'),
        backgroundColor: const Color(0xFFD60030),
      ),
      body: ListView(
        children: [
          _buildHistoryItem('Jan 15, 2024', 'Narahenpita Hospital'),
          _buildHistoryItem('Aug 20, 2023', 'Kandy Blood Center'),
        ],
      ),
    );
  }

  Widget _buildHistoryItem(String date, String location) {
    return ListTile(
      leading: const Icon(
        Icons.water_drop,
        color: Color(0xFFD60030),
      ),
      title: Text(
        date,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        location,
        style: const TextStyle(fontFamily: 'Poppins'),
      ),
    );
  }
}