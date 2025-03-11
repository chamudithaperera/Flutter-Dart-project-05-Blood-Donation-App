import 'package:flutter/material.dart';

class ThirdContainer extends StatelessWidget {
  const ThirdContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSection("Before Donation", "assets/BeforeDonation.jpg", [
            "Stay hydrated before donating.",
            "Eat a nutritious meal, avoid fatty foods.",
            "Get a good night’s sleep.",
            "Bring an ID and donor card if available.",
            "Avoid alcohol 24 hours before donation."
          ]),
          _buildSection("After Donation", "assets/AfterDonation.jpg", [
            "Rest for at least 15 minutes after donating.",
            "Drink plenty of fluids for the next 24 hours.",
            "Avoid heavy lifting or strenuous exercise.",
            "If dizzy, lie down and elevate your legs.",
            "Keep the bandage on for a few hours to prevent bruising."
          ]),
          _buildSection("Healthy Habits", "assets/HealthyHabits.jpg", [
            "Maintain a balanced diet rich in iron.",
            "Exercise regularly but avoid overexertion after donating.",
            "Stay hydrated to help your body recover.",
            "Donate blood regularly if eligible.",
            "Encourage others to donate and save lives!"
          ]),
        ],
      ),
    );
  }

  Widget _buildSection(
      String title, String imagePath, List<String> guidelines) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(imagePath,
                  fit: BoxFit.cover, height: 180, width: double.infinity),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Column(
                    children: guidelines
                        .map((guideline) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "• $guideline",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
