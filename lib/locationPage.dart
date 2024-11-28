import 'package:flutter/material.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donation Locations'),
        backgroundColor: const Color(0xFFD60030),
      ),
      body: ListView(
        children: [
          _buildLocationCard('Narahenpita Hospital', '123 Main St'),
          _buildLocationCard('Kandy Blood Center', '456 Central Ave'),
        ],
      ),
    );
  }

  Widget _buildLocationCard(String name, String address) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(
          name,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          address,
          style: const TextStyle(fontFamily: 'Poppins'),
        ),
        trailing: const Icon(Icons.location_on, color: Color(0xFFD60030)),
      ),
    );
  }
}