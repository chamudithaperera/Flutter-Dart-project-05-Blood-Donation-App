import 'package:flutter/material.dart';

class ThirdContainer extends StatelessWidget {
  const ThirdContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF5F7),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xFFD60033).withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Eligibility Guidelines',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                _buildBulletPoint('Age: 18-60 years'),
                _buildBulletPoint('Weight: Above 50kg'),
                _buildBulletPoint(
                    'Hemoglobin: Males > 13g/dL, Females > 12g/dL'),
                _buildBulletPoint('Wait 3 months between donations'),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16, left: 4, top: 10),
            child: Row(
              children: [
                Container(
                  height: 16,
                  width: 3,
                  decoration: const BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  "Blood Donation Instructions",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF333333),
                  ),
                ),
              ],
            ),
          ),
          _buildSection("Before Donation", "assets/BeforeDonation.jpg", [
            "Stay hydrated before donating.",
            "Eat a nutritious meal, avoid fatty foods.",
            "Get a good night's sleep.",
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
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Material(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    height: 160,
                    width: double.infinity,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.7),
                            Colors.transparent,
                          ],
                        ),
                      ),
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: guidelines
                      .map((guideline) => Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 4, right: 10),
                                  width: 5,
                                  height: 5,
                                  decoration: const BoxDecoration(
                                    color: Colors.redAccent,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    guideline,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF4A4A4A),
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(
              color: Color(0xFFD60033),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
