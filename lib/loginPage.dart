import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 40),
                // Welcome Text
                Text(
                  'Welcome Donators',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins', // Added font family
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Login or Sign up to access your account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins', // Added font family
                    fontSize: 14,
                    color: const Color.fromARGB(203, 0, 0, 0),
                  ),
                ),
                SizedBox(height: 40),
                // Login Section
                Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins', // Added font family
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20),
                // NIC Number Input
                buildInputField(
                  labelText: 'NIC Number',
                  icon: Icons.badge,
                ),
                SizedBox(height: 16),
                // Password Input
                buildInputField(
                  labelText: 'Password',
                  icon: Icons.lock,
                  obscureText: true,
                  suffixIcon: Icons.visibility_off,
                ),
                SizedBox(height: 8),
                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      // Forgot Password action
                    },
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                        fontFamily: 'Poppins', // Added font family
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: const Color(0xFFD60030),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32),
                // Login Button with Hover and Click Effects
                MouseRegion(
                  onEnter: (_) {
                    // Hover start action
                  },
                  onExit: (_) {
                    // Hover end action
                  },
                  child: GestureDetector(
                    onTapDown: (_) {
                      // Button press action
                    },
                    onTapUp: (_) {
                      // Button release action
                    },
                    onTap: () {
                      // Handle button click
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      height: 56,
                      decoration: BoxDecoration(
                        color: Color(0xFFD60030),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: Offset(0, 4),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontFamily: 'Poppins', // Added font family
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // Create Account Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        'Don’t have an account yet? ',
                        style: TextStyle(
                          fontFamily: 'Poppins', // Added font family
                          fontSize: 12,
                          color: const Color(0xFFD60030),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to Create Account Page
                      },
                      child: Text(
                        'Create one',
                        style: TextStyle(
                          fontFamily: 'Poppins', // Added font family
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFD60030),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 54),
                // Terms and Privacy Policy
                Text(
                  'By signing in with an account, you agree to BloodHope\'s Terms of Service and Privacy Policy.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins', // Added font family
                    fontSize: 12,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInputField({
    required String labelText,
    required IconData icon,
    bool obscureText = false,
    IconData? suffixIcon,
  }) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          fontFamily: 'Poppins', // Added font family
          fontSize: 14,
          color: Color(0xFFD60030),
        ),
        prefixIcon: Icon(
          icon,
          color: Color(0xFFD60030),
        ),
        suffixIcon: suffixIcon != null
            ? Icon(
                suffixIcon,
                color: Color(0xFFD60030),
              )
            : null,
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Color(0xFFD60030), // Stroke color
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Color(0xFFD60030), // Stroke color
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
