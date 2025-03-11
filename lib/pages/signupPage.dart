import 'package:flutter/material.dart';

import '../widgets/blood_group_dropdown.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/terms_privacy_section.dart';
import 'loginPage.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nicController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String? _selectedBloodGroup;

  @override
  void dispose() {
    _nameController.dispose();
    _nicController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSignup() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_selectedBloodGroup == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a blood group')),
        );
        return;
      }

      // TODO: Implement signup logic
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sign up button pressed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.08,
              vertical: size.height * 0.04,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: size.height * 0.04),

                  // Heading
                  const Text(
                    'Welcome Donators',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFD60033),
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),

                  // Subheading
                  const Text(
                    'Login or Sign up to access your account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: size.height * 0.06),

                  // Sign Up Text
                  const Text(
                    'Sign Up',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),

                  // Input Fields
                  CustomTextField(
                    hintText: "Full Name",
                    icon: Icons.person_outline,
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: size.height * 0.02),

                  CustomTextField(
                    hintText: "NIC Number",
                    icon: Icons.badge_outlined,
                    controller: _nicController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your NIC number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: size.height * 0.02),

                  CustomTextField(
                    hintText: "Password",
                    icon: Icons.lock_outline,
                    isPassword: true,
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: size.height * 0.02),

                  CustomTextField(
                    hintText: "Confirm Password",
                    icon: Icons.lock_outline,
                    isPassword: true,
                    controller: _confirmPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      } else if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: size.height * 0.02),

                  BloodGroupDropdown(
                    selectedBloodGroup: _selectedBloodGroup,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedBloodGroup = newValue;
                      });
                    },
                  ),
                  SizedBox(height: size.height * 0.04),

                  // Sign Up Button
                  CustomButton(
                    text: 'Sign Up',
                    onPressed: _handleSignup,
                  ),
                  SizedBox(height: size.height * 0.03),

                  // Login Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account? ",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color(0xFFD60033),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Spacer to push content down
                  SizedBox(height: size.height * 0.04),

                  // Terms and Privacy Section
                  const TermsPrivacySection(isSignIn: false),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
