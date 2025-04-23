import 'package:blood_donation_app/pages/loadingPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(const MyApp());
  } catch (e) {
    print('Error initializing Firebase: $e');
    // Still run the app, but it will work in offline mode
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Donation App',
      theme: ThemeData(
        primaryColor: const Color(0xFFD60033),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD60033),
          primary: const Color(0xFFD60033),
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoadingPage(),
    );
  }
}
