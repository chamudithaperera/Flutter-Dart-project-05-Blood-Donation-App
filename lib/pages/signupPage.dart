import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/terms_privacy_section.dart';
import 'loginPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// Removed: import 'package:firebase_auth/firebase_auth.dart';
// Removed: import 'package:cloud_firestore/cloud_firestore.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  bool _isLoading = false;
  String _selectedBloodGroup = 'A+';

  final List<String> _bloodGroups = [
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-'
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  Future<void> _handleSignup() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });
      try {
        final response = await http.post(
          Uri.parse('http://192.168.8.105:8500/register'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'name': _nameController.text.trim(),
            'email': _emailController.text.trim(),
            'password': _passwordController.text.trim(),
            'bloodGroup': _selectedBloodGroup,
            'phone': _phoneController.text.trim(),
            'address': _addressController.text.trim(),
          }),
        );
        if (response.statusCode == 201) {
          if (mounted) {
            setState(() {
              _isLoading = false;
            });
            await showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text('Signup Successful'),
                content:
                    const Text('Your account has been created. Please login.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const LoginPage()),
                      );
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          }
        } else {
          final errorMsg =
              jsonDecode(response.body)['message'] ?? 'Signup failed.';
          if (mounted) {
            setState(() {
              _isLoading = false;
            });
            await showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text('Signup Failed'),
                content: Text(errorMsg),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          }
        }
      } catch (e) {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
          await showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Error'),
              content: Text('Could not connect to server. Please try again.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      }
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
                  SizedBox(height: size.height * 0.06),

                  // Heading
                  const Text(
                    'Create Account',
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
                    'Sign up to start donating blood',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: size.height * 0.06),

                  // Input Fields
                  CustomTextField(
                    hintText: "Full Name",
                    icon: Icons.person_outline,
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: size.height * 0.02),

                  CustomTextField(
                    hintText: "Email",
                    icon: Icons.email_outlined,
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!value.contains('@')) {
                        return 'Please enter a valid email';
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
                        return 'Please enter a password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
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
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: size.height * 0.02),

                  CustomTextField(
                    hintText: "Phone Number",
                    icon: Icons.phone_outlined,
                    controller: _phoneController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: size.height * 0.02),

                  CustomTextField(
                    hintText: "Address",
                    icon: Icons.location_on_outlined,
                    controller: _addressController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: size.height * 0.02),

                  // Blood Group Dropdown
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _selectedBloodGroup,
                        isExpanded: true,
                        icon: const Icon(Icons.arrow_drop_down),
                        items: _bloodGroups.map((String group) {
                          return DropdownMenuItem<String>(
                            value: group,
                            child: Text(group),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            setState(() {
                              _selectedBloodGroup = newValue;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),

                  // Sign Up Button
                  CustomButton(
                    text: 'Sign Up',
                    onPressed: _isLoading ? null : _handleSignup,
                    isLoading: _isLoading,
                  ),
                  SizedBox(height: size.height * 0.03),
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

                  // Spacer
                  SizedBox(height: size.height * 0.15),

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
