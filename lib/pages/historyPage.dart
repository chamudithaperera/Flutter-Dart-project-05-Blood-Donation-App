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

  factory DonationHistory.fromFirestore(DocumentSnapshot doc) {
    try {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      print('Raw Firestore data: $data'); // Debug print

      // Safely handle the dateTime field
      DateTime parsedDateTime;
      try {
        parsedDateTime = (data['dateTime'] as Timestamp).toDate();
      } catch (e) {
        print('Error parsing dateTime: $e');
        parsedDateTime = DateTime.now();
      }

      return DonationHistory(
        dateTime: parsedDateTime,
        place: data['place']?.toString() ?? 'Unknown',
        volume: data['volume']?.toString() ?? '0',
        bloodGroup: data['bloodGroup']?.toString() ?? 'Unknown',
        isCompleted: data['isCompleted'] ?? false,
        attempt: (data['attempt'] ?? 1) as int,
        userId: data['userId']?.toString() ?? '',
      );
    } catch (e) {
      print('Error creating DonationHistory: $e');
      rethrow;
    }
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
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      // Check if user is logged in
      final user = _auth.currentUser;
      if (user == null) {
        // If not logged in, try to wait for auth state to change
        await Future.delayed(const Duration(seconds: 1));
        final updatedUser = _auth.currentUser;
        if (updatedUser == null) {
          setState(() {
            _error = 'Please log in to view donation history';
            _isLoading = false;
          });
          return;
        }
      }

      // Test Firestore connection
      await _firestore.collection('donations').limit(1).get();

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print('Error during initialization: $e');
      setState(() {
        _error = 'Error connecting to database: $e';
        _isLoading = false;
      });
    }
  }

  Stream<QuerySnapshot> _getDonationsStream() {
    return _firestore
        .collection('donations')
        .orderBy('dateTime', descending: true)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.3),
        leading: appBarLeading,
        title: appBarText,
        actions: appBarAction,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(_error!, style: const TextStyle(color: Colors.red)),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _checkAuth,
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Search a history',
                          hintStyle: const TextStyle(color: Colors.grey),
                          prefixIcon:
                              const Icon(Icons.search, color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                const BorderSide(color: Color(0xFFD60033)),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: StreamBuilder<QuerySnapshot>(
                        stream: _getDonationsStream(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Error loading donations:\n${snapshot.error}',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                  const SizedBox(height: 16),
                                  ElevatedButton(
                                    onPressed: _checkAuth,
                                    child: const Text('Retry'),
                                  ),
                                ],
                              ),
                            );
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          final docs = snapshot.data?.docs ?? [];
                          if (docs.isEmpty) {
                            return const Center(
                              child: Text('No donation history found'),
                            );
                          }

                          return ListView.builder(
                            padding: const EdgeInsets.all(16),
                            itemCount: docs.length,
                            itemBuilder: (context, index) {
                              try {
                                final donation =
                                    DonationHistory.fromFirestore(docs[index]);
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
                              } catch (e) {
                                print('Error building card: $e');
                                return const SizedBox.shrink();
                              }
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
