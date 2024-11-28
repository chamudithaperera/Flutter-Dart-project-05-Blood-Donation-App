import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class StatsRow extends StatelessWidget {
  const StatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: StatCard(
            title: 'Thank You!', 
            value: '2', 
            subtitle: 'You did donations',
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            children: [
              const BloodGroupCard(),
              const SizedBox(height: 16),
              CircularEligibilityIndicator(),
            ],
          ),
        ),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;

  const StatCard({
    super.key, 
    required this.title, 
    required this.value, 
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Color(0xFFD60030),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}

class BloodGroupCard extends StatelessWidget {
  const BloodGroupCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Blood Group',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'O+',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFFD60030),
            ),
          ),
        ],
      ),
    );
  }
}

class CircularEligibilityIndicator extends StatelessWidget {
  const CircularEligibilityIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 50,
      lineWidth: 10,
      percent: 0.75,
      center: const Text(
        'Eligible in\n15 days',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Color(0xFFD60030),
        ),
      ),
      progressColor: const Color(0xFFD60030),
      backgroundColor: const Color(0xFFF5E6E6),
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}