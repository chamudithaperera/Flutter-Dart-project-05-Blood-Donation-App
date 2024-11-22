
import 'package:blood_donation_app/splashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      title: 'Splash Screen',
      theme: ThemeData(
        primaryColor: const Color(0xFFD60030),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFFD60030), 
        ),
        fontFamily: 'Poppins', // Set the main font to Poppins
      ), 
      home: SplashScreen(), 
      debugShowCheckedModeBanner: false, 
    ); 
  } 
} 
  

