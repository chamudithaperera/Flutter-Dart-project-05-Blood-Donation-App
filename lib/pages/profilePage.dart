import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map<String, dynamic>? userData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      final User? user = _auth.currentUser;
      if (user != null) {
        print('Loading data for user: ${user.uid}');
        final DocumentSnapshot doc =
            await _firestore.collection('users').doc(user.uid).get();

        if (doc.exists) {
          print('Document data: ${doc.data()}');
          setState(() {
            userData = doc.data() as Map<String, dynamic>;
            isLoading = false;
          });
        } else {
          print('No user document found');
          await _firestore.collection('users').doc(user.uid).set({
            'name': user.displayName ?? 'Your Name',
            'email': user.email ?? '',
            'bloodGroup': 'O+',
            'phone': 'xxxxxxxxxx',
            'location': 'Colombo',
            'nic': 'xxxxxxxxxxxx',
          });

          setState(() {
            userData = {
              'name': user.displayName ?? 'Your Name',
              'email': user.email ?? '',
              'bloodGroup': 'O+',
              'phone': 'xxxxxxxxxx',
              'location': 'Colombo',
              'nic': 'xxxxxxxxxxxx',
            };
            isLoading = false;
          });
        }
      } else {
        print('No user is currently logged in');
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error loading user data: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _signOut() async {
    try {
      await _auth.signOut();
      Navigator.of(context).pushReplacementNamed('/login');
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'BloodHope',
          style: TextStyle(
            color: Color(0xFFD60033),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Color(0xFFD60033),
          ),
          onPressed: () {},
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
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Top Card with Profile Info
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 24),
                          // Profile Image
                          Container(
                            width: 100,
                            height: 100,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFD60033),
                            ),
                            child: const Icon(
                              Icons.person,
                              size: 60,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 16),
                          // User Name
                          Text(
                            userData?['name'] ?? 'Your Name',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          // NIC Number
                          Text(
                            'NIC No: ${userData?['nic'] ?? 'xxxxxxxxxxxx'}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // QR Buttons Row
                    Row(
                      children: [
                        Expanded(
                          child: _buildOutlinedButton('Scan QR', () {}),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildOutlinedButton('My QR', () {}),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Info Card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildInfoRow(
                              'Blood group:', userData?['bloodGroup'] ?? 'O+'),
                          const SizedBox(height: 12),
                          _buildInfoRow('Contact Number:',
                              userData?['phone'] ?? 'xxxxxxxxxx'),
                          const SizedBox(height: 12),
                          _buildInfoRow(
                              'Location:', userData?['location'] ?? 'Colombo'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Settings Button
                    _buildOutlinedButton('Settings', () {}),
                    const SizedBox(height: 16),
                    // Log out Button
                    _buildOutlinedButton('Log out', _signOut),
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
