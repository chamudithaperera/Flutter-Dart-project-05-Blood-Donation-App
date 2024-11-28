import 'package:flutter/material.dart';

class CampaignsList extends StatelessWidget {
  const CampaignsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          CampaignCard(
            location: 'Narahenpita', 
            imagePath: 'assets/blood_donation_poster_1.jpg',
          ),
          SizedBox(width: 16),
          CampaignCard(
            location: 'Kandy', 
            imagePath: 'assets/blood_donation_poster_2.jpeg',
          ),
        ],
      ),
    );
  }
}

class CampaignCard extends StatelessWidget {
  final String location;
  final String imagePath;

  const CampaignCard({
    super.key, 
    required this.location, 
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 100,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              location,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}