import 'package:flutter/material.dart';
import 'campaignDetail.dart';

class PosterContainer extends StatelessWidget {
  final String location;
  final String date;
  final String time;
  final String details;
  final String? imagePath;

  const PosterContainer({
    super.key,
    required this.location,
    required this.date,
    required this.time,
    required this.details,
    this.imagePath,
  });

  void _showCampaignDetail(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CampaignDetail(
        imagePath: imagePath,
        location: location,
        date: date,
        time: time,
        details: details,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showCampaignDetail(context),
      child: Container(
        height: 203,
        width: 160,
        decoration: BoxDecoration(
          color: const Color(0xFFF5E6EA),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.place, size: 15),
                  const SizedBox(width: 5),
                  Text(
                    location,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: imagePath != null
                    ? DecorationImage(
                        image: AssetImage(imagePath!),
                        fit: BoxFit.cover,
                      )
                    : null,
                color: imagePath == null ? Colors.grey[300] : null,
              ),
              child: imagePath == null
                  ? const Center(
                      child: Icon(Icons.image, size: 50, color: Colors.grey),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
