import 'package:flutter/material.dart';
// Removed: import 'package:firebase_auth/firebase_auth.dart';
// Removed: import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, dynamic>? userData;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // Stub: No user data loading
    userData = {
      'name': 'Your Name',
      'nic': 'xxxxxxxxxxxx',
      'bloodGroup': 'O+',
      'phone': 'xxxxxxxxxx',
      'location': 'Colombo',
      'email': 'your.email@example.com',
    };
    isLoading = false;
  }

  // Removed: _loadUserData, _updateUserData, _signOut

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.3),
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Color(0xFFD60033),
          ),
          onPressed: () {},
        ),
        title: const Text(
          'BloodHope',
          style: TextStyle(
            color: Color(0xFFD60033),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.person,
              color: Color(0xFFD60033),
            ),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: const Color(0xFFFAFAFA),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : userData == null
              ? const Center(child: Text('No user data available.'))
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: ${userData!['name']}'),
                        Text('NIC: ${userData!['nic']}'),
                        Text('Blood Group: ${userData!['bloodGroup']}'),
                        Text('Phone: ${userData!['phone']}'),
                        Text('Location: ${userData!['location']}'),
                        Text('Email: ${userData!['email']}'),
                        const SizedBox(height: 16),
                        // Log out Button
                        OutlinedButton(
                          onPressed: () {},
                          child: const Text('Log out'),
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 14, color: Colors.black),
        children: [
          TextSpan(
            text: label + ' ',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOutlinedButton(String text, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          side: const BorderSide(color: Colors.grey),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
