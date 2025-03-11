import 'package:flutter/material.dart';

class TermsPrivacySection extends StatelessWidget {
  final bool isSignIn;

  const TermsPrivacySection({
    Key? key,
    this.isSignIn = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          Text(
            isSignIn
                ? 'By signing in, you agree to BloodHope\'s'
                : 'By signing up, you agree to BloodHope\'s',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text(
                  'Terms of Service',
                  style: TextStyle(
                    fontSize: 12,
                    decoration: TextDecoration.underline,
                    color: Color(0xFFD60033),
                  ),
                ),
              ),
              const Text('|', style: TextStyle(fontSize: 12)),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text(
                  'Privacy Policy',
                  style: TextStyle(
                    fontSize: 12,
                    decoration: TextDecoration.underline,
                    color: Color(0xFFD60033),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
