import 'package:blood_donation_app/homePage.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Blood group dropdown values
  final List<String> bloodGroups = ['A-', 'A+', 'B-', 'B+', 'AB-', 'AB+', 'O-', 'O+'];
  String? selectedBloodGroup;

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
                const SizedBox(height: 40),
                // Welcome Text
                const Text(
                  'Welcome Donators',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Create your BloodHope account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Color.fromARGB(203, 0, 0, 0),
                  ),
                ),
                const SizedBox(height: 40),
                // Register Section
                const Text(
                  'Register',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                // Name Input
                buildInputField(
                  labelText: 'Full Name',
                  icon: Icons.person,
                ),
                const SizedBox(height: 16),
                // NIC Number Input
                buildInputField(
                  labelText: 'NIC Number',
                  icon: Icons.badge,
                ),
                const SizedBox(height: 16),
                // Blood Group Dropdown
                buildBloodGroupDropdown(),
                const SizedBox(height: 16),
                // Password Input
                buildInputField(
                  labelText: 'Password',
                  icon: Icons.lock,
                  obscureText: true,
                  suffixIcon: Icons.visibility_off,
                ),
                const SizedBox(height: 16),
                // Confirm Password Input
                buildInputField(
                  labelText: 'Confirm Password',
                  icon: Icons.lock,
                  obscureText: true,
                  suffixIcon: Icons.visibility_off,
                ),
                const SizedBox(height: 32),
                // Register Button
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
                      // Handle registration logic
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const BloodHopeHomePage()),
                      );
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: 56,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD60030),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: const Offset(0, 4),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          'Create Account',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Login Instead Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Flexible(
                      child: Text(
                        'Already have an account? ',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: Color(0xFFD60030),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to Login Page
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFD60030),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 54),
                // Terms and Privacy Policy
                const Text(
                  'By creating an account, you agree to BloodHope\'s Terms of Service and Privacy Policy.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Custom method to build blood group dropdown
  Widget buildBloodGroupDropdown() {
    return DropdownButtonFormField<String>(
      dropdownColor: Colors.white,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        prefixIcon: const Icon(
          Icons.water_drop,
          color: Color(0xFFD60030),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xFFD60030),
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xFFD60030),
            width: 2.0,
          ),
        ),
        labelText: 'Blood Group',
        labelStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          color: Color(0xFFD60030),
        ),
      ),
      value: selectedBloodGroup,
      hint: const Text(
        'Select Blood Group',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          color: Color(0xFFD60030),
        ),
      ),
      items: bloodGroups.map((String bloodGroup) {
        return DropdownMenuItem<String>(
          value: bloodGroup,
          child: Text(
            bloodGroup,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              color: Color(0xFFD60030),
            ),
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          selectedBloodGroup = newValue;
        });
      },
      icon: const Icon(
        Icons.arrow_drop_down,
        color: Color(0xFFD60030),
      ),
    );
  }

  // Reused input field method from login page
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
        labelStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          color: Color(0xFFD60030),
        ),
        prefixIcon: Icon(
          icon,
          color: const Color(0xFFD60030),
        ),
        suffixIcon: suffixIcon != null
            ? Icon(
                suffixIcon,
                color: const Color(0xFFD60030),
              )
            : null,
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xFFD60030),
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xFFD60030),
            width: 2.0,
          ),
        ),
      ),
    );
  }
}