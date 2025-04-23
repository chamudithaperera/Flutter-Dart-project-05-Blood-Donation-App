import 'package:blood_donation_app/widgets/main_Appbar.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DonationHistory {
  final DateTime dateTime;
  final String place;
  final String volume;
  final String bloodGroup;
  final bool isCompleted;
  final int attempt;
  final String userId;

  DonationHistory({
    required this.dateTime,
    required this.place,
    required this.volume,
    required this.bloodGroup,
    required this.isCompleted,
    required this.attempt,
    required this.userId,
  });

  // Convert Firestore document to DonationHistory object
  factory DonationHistory.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return DonationHistory(
      dateTime: (data['dateTime'] as Timestamp).toDate(),
      place: data['place'] ?? '',
      volume: data['volume']?.toString() ?? '',
      bloodGroup: data['bloodGroup'] ?? '',
      isCompleted: data['isCompleted'] ?? false,
      attempt: data['attempt'] ?? 1,
      userId: data['userId'] ?? '',
    );
  }

  // Convert DonationHistory object to Firestore document
  Map<String, dynamic> toFirestore() {
    return {
      'dateTime': Timestamp.fromDate(dateTime),
      'place': place,
      'volume': volume,
      'bloodGroup': bloodGroup,
      'isCompleted': isCompleted,
      'attempt': attempt,
      'userId': userId,
    };
  }
}

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final TextEditingController _searchController = TextEditingController();
  final User? currentUser = FirebaseAuth.instance.currentUser;
  Stream<QuerySnapshot>? _donationsStream;

  @override
  void initState() {
    super.initState();
    _initializeStream();
  }

  void _initializeStream() {
    if (currentUser != null) {
      _donationsStream = FirebaseFirestore.instance
          .collection('donations')
          .where('userId', isEqualTo: currentUser!.uid)
          .orderBy('dateTime', descending: true)
          .snapshots();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (currentUser == null) {
      return const Scaffold(
        body: Center(
          child: Text('Please log in to view your donation history'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.3),
        leading: appBarLeading,
        title: appBarText,
        actions: appBarAction,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search a history',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Color(0xFFD60033)),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  // Search functionality will be implemented here
                });
              },
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _donationsStream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text('No donation history found'),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final donation = DonationHistory.fromFirestore(
                      snapshot.data!.docs[index],
                    );
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _buildHistoryCard(
                        date:
                            '${donation.dateTime.year}-${donation.dateTime.month.toString().padLeft(2, '0')}-${donation.dateTime.day.toString().padLeft(2, '0')}',
                        time:
                            '${donation.dateTime.hour.toString().padLeft(2, '0')}:${donation.dateTime.minute.toString().padLeft(2, '0')} ${donation.dateTime.hour < 12 ? 'AM' : 'PM'}',
                        place: donation.place,
                        volume: '${donation.volume} ml',
                        bloodGroup: donation.bloodGroup,
                        isCompleted: donation.isCompleted,
                        attempt: donation.attempt,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryCard({
    required String date,
    required String time,
    required String place,
    required String volume,
    required String bloodGroup,
    required bool isCompleted,
    required int attempt,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xFFFFF5F7),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD60033),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    attempt.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              time,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              place,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildInfoItem('Volume:', volume),
                const SizedBox(width: 24),
                _buildInfoItem('Blood group:', bloodGroup),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: isCompleted ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    isCompleted ? 'Completed' : 'Not Completed',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
