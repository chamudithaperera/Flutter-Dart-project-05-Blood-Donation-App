import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProfilePage extends StatefulWidget {
  final String email;
  const ProfilePage({super.key, required this.email});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, dynamic>? _userData;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    setState(() {
      _userData = {
        'name': 'John Doe',
        'nic': '991234567V',
        'bloodGroup': 'O+',
        'lastDonation': '2024-02-15',
        'totalDonations': 5,
        'phone': '+94 77 123 4567',
        'email': widget.email,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_userData == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: const Color(0xFFD60033),
        title: Text(
          'Profile',
          style: TextStyle(
            color: const Color(0xFFD60033),
            fontWeight: FontWeight.bold,
            fontSize: 22,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.18),
                offset: const Offset(0, 2),
                blurRadius: 3,
              ),
            ],
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Color(0xFFD60033)),
            onPressed: () {
              // Edit functionality
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
              child: Column(
                children: [
                  _qrCard(),
                  const SizedBox(height: 28),
                  _buildInfoCard(title: 'Personal Information', items: [
                    _infoTile(Icons.person, 'Name', _userData!['name']),
                    _infoTile(Icons.badge, 'NIC', _userData!['nic']),
                    _infoTile(Icons.water_drop, 'Blood Group',
                        _userData!['bloodGroup']),
                    _infoTile(Icons.phone, 'Phone', _userData!['phone']),
                    _infoTile(Icons.email, 'Email', _userData!['email']),
                  ]),
                  const SizedBox(height: 18),
                  _buildInfoCard(title: 'Donation Details', items: [
                    _infoTile(Icons.calendar_today, 'Last Donation',
                        _userData!['lastDonation']),
                    _infoTile(Icons.history, 'Total Donations',
                        _userData!['totalDonations'].toString()),
                  ]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // QR code card widget
  Widget _qrCard() {
    return Card(
      color: Colors.white.withOpacity(0.96),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
        child: Column(
          children: [
            QrImageView(
              data: _userData!['nic'] ?? "No NIC",
              version: QrVersions.auto,
              size: 100,
              foregroundColor: const Color(0xFFD60033),
              backgroundColor: Colors.white,
            ),
            const SizedBox(height: 12),
            Text(
              "Scan this QR to get your profile info",
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 14,
                letterSpacing: 0.2,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({required String title, required List<Widget> items}) {
    return Card(
      elevation: 6,
      shadowColor: const Color(0xFFD60033).withOpacity(0.15),
      color: Colors.white.withOpacity(0.86),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xFFD60033),
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 15),
            ...items,
          ],
        ),
      ),
    );
  }

  Widget _infoTile(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.5),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFD60033), size: 22),
          const SizedBox(width: 14),
          Text(
            label,
            style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
