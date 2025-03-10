import 'package:blood_donation_app/pages/getStartPage.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  late AnimationController _logoController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _pulseAnimation;

  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _progressOpacityAnimation;

  @override
  void initState() {
    super.initState();

    // Fade-in animation for overall content
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );

    // Logo animations: scale and subtle pulse
    _logoController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    // Scale animation for logo
    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.7, end: 1.05)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 60,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.05, end: 1.0)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 40,
      ),
    ]).animate(_logoController);

    // Subtle pulse animation (reduced intensity)
    _pulseAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 1.0)
            .chain(CurveTween(curve: Curves.linear)),
        weight: 70,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 1.04)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 15,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.04, end: 1.0)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 15,
      ),
    ]).animate(_logoController);

    // Slide animation for text
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutCubic,
    ));

    // Create a separate opacity animation for the progress indicator
    // using the same controller as the slide animation
    _progressOpacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeIn,
    ));

    // Start animations sequence
    _fadeController.forward();
    _logoController.forward();

    Future.delayed(const Duration(milliseconds: 800), () {
      _slideController.forward();
    });

    // Navigate to next page after animations complete
    Timer(const Duration(milliseconds: 3200), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 700),
          pageBuilder: (_, __, ___) => const GetStartPage(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _logoController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffD60030),
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animated Logo with subtle pulse
                AnimatedBuilder(
                  animation: _logoController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _scaleAnimation.value * _pulseAnimation.value,
                      child: Image.asset(
                        "assets/logo.png",
                        width: 180,
                        height: 180,
                      ),
                    );
                  },
                ),

                const SizedBox(height: 24),

                // App Name with Slide Animation
                SlideTransition(
                  position: _slideAnimation,
                  child: const Text(
                    'BloodHope',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Poppins-Bold',
                      fontSize: 32,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Simple loading indicator with proper opacity animation
                SizedBox(
                  width: 180,
                  child: FadeTransition(
                    opacity: _progressOpacityAnimation,
                    child: const LinearProgressIndicator(
                      backgroundColor: Color(0xffFF3355),
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
