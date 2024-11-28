import 'package:flutter/material.dart';

class DonationTipsText extends StatelessWidget {
  const DonationTipsText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      '1. Hydrate Well:\n- Drink plenty of water.\n\n2. Eat Healthy Meals:\n- Include iron-rich food before donating.',
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        color: Colors.black54,
      ),
    );
  }
}