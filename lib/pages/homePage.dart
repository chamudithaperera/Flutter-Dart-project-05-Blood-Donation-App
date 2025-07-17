import 'package:flutter/material.dart';
// Removed: import 'package:firebase_auth/firebase_auth.dart';
// Removed: import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/homePage/firstContainer.dart';
import '../widgets/homePage/fourthContainer.dart';
import '../widgets/main_Appbar.dart';
import '../widgets/homePage/secondContainer.dart';
import '../widgets/homePage/thirdContainer.dart';

class HomePage extends StatefulWidget {
  final Map<String, dynamic>? user;
  const HomePage({super.key, this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Removed: final FirebaseAuth _auth = FirebaseAuth.instance;
  // Removed: final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map<String, dynamic>? userData;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // Stub: No user data loading
    userData = null;
    isLoading = false;
  }

  // Removed: Future<void> _loadUserData() async {
  // Removed:   try {
  // Removed:     final User? user = _auth.currentUser;
  // Removed:     if (user != null) {
  // Removed:       final DocumentSnapshot doc =
  // Removed:           await _firestore.collection('users').doc(user.uid).get();
  // Removed:       if (doc.exists) {
  // Removed:         setState(() {
  // Removed:           userData = doc.data() as Map<String, dynamic>;
  // Removed:           isLoading = false;
  // Removed:         });
  // Removed:       }
  // Removed:     }
  // Removed:   } catch (e) {
  // Removed:     print('Error loading user data: $e');
  // Removed:     setState(() {
  // Removed:       isLoading = false;
  // Removed:     });
  // Removed:   }
  // Removed: }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: appBarLeading,
          title: appBarText,
          actions: getAppBarActions(context),
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome!',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                widget.user != null &&
                                        widget.user!['name'] != null
                                    ? widget.user!['name']
                                    : 'User Name',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    FirstContainer(user: widget.user),
                    const SecondContainer(),
                    const ThirdContainer(),
                    const FourthContainer(),
                  ],
                ),
              ));
  }
}
