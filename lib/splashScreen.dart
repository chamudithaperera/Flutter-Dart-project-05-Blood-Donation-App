// splash_screen.dart
import 'dart:async';

import 'package:blood_donation_app/getStartedPage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
 
  @override 
  _SplashScreenState createState() => _SplashScreenState(); 
} 
class _SplashScreenState extends State<SplashScreen> { 
  @override 
  void initState() { 
    super.initState(); 
    Timer(const Duration(seconds: 1), 
          ()=>Navigator.pushReplacement(context, 
              MaterialPageRoute(builder: 
                  (context) =>  
                    const GetStartedPage() 
                  ) 
              ) 
         ); 
  } 
  @override 
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFD60033),
      child: Center(
        child: Image.asset('assets/logo.png'),
      ),
    );
  }
}