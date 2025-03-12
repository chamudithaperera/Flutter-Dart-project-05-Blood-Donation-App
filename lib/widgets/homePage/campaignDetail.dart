import 'package:flutter/material.dart';

class CampaignDetail extends StatelessWidget {
  final String? imagePath;
  final String location;
  final String date;
  final String time;
  final String details;

  const CampaignDetail({
    super.key,
    required this.imagePath,
    required this.location,
    required this.date,
    required this.time,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(15),
        width: 350,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: imagePath != null
                      ? Image.asset(
                          imagePath!,
                          height: 250,
                          width: 250,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          height: 250,
                          width: 250,
                          color: Colors.grey[300],
                          child: const Icon(Icons.image,
                              size: 50, color: Colors.grey),
                        ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const CircleAvatar(
                      backgroundColor: Colors.black54,
                      radius: 18,
                      child: Icon(Icons.close, color: Colors.white, size: 20),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              "Blood Donation Campaign",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[700]),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.place, color: Colors.red, size: 18),
                const SizedBox(width: 5),
                Text(
                  location,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.calendar_today, color: Colors.blue, size: 18),
                const SizedBox(width: 5),
                Text(
                  date,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 15),
                const Icon(Icons.access_time, color: Colors.green, size: 18),
                const SizedBox(width: 5),
                Text(
                  time,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              details,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[700],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
              ),
              child: const Text("Close",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
