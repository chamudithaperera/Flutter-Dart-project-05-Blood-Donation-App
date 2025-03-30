import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic>? _userData;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    // TODO: Implement actual user data fetching from your backend
    // For now, we'll use dummy data
    setState(() {
      _userData = {
        'name': 'John Doe',
        'nic': '991234567V',
        'bloodGroup': 'O+',
        'lastDonation': '2024-02-15',
        'totalDonations': 5,
        'phone': '+94 77 123 4567',
        'email': 'john.doe@example.com',
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_userData == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color(0xFFD60033),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Color(0xFFD60033),
                    child: Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _userData!['name'],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Blood Group: ${_userData!['bloodGroup']}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFFD60033),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // User Information
            _buildInfoCard(
              title: 'Personal Information',
              children: [
                _buildInfoRow('NIC', _userData!['nic']),
                _buildInfoRow('Phone', _userData!['phone']),
                _buildInfoRow('Email', _userData!['email']),
              ],
            ),
            const SizedBox(height: 16),

            // Donation Information
            _buildInfoCard(
              title: 'Donation Information',
              children: [
                _buildInfoRow('Last Donation', _userData!['lastDonation']),
                _buildInfoRow(
                    'Total Donations', _userData!['totalDonations'].toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(
      {required String title, required List<Widget> children}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFD60033),
              ),
            ),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
