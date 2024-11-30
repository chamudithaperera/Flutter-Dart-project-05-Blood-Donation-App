import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD60030),
        title: const Text(
          'BloodHope',
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255)),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.person_outline,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ],
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      body: Container(
        color: Color(0xFFFDF2F5),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome!',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Your Name',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 16),
                buildStatsRow(),
                const SizedBox(height: 20),
                const Text(
                  'Blood Donation Campaign Near Your',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      buildCampaignCard(
                          'Narahenpita', 'assets/blood_donation_poster_1.jpg'),
                      buildCampaignCard(
                          'Narahenpita', 'assets/blood_donation_poster_2.jpeg'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Before Blood Donation',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '1. Hydrate Well:\n - Drink plenty of water (at least 16-18 ounces) the day before and on the day of donation to maintain blood volume.\n\n2. Eat a Healthy Meal:',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none, // Important for allowing overflow
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 10), // Reduce overall bar height
            child: BottomNavigationBar(
              backgroundColor: const Color(0xFFD60030),
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white54,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: 24),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.location_on, size: 24),
                  label: 'Map',
                ),
                BottomNavigationBarItem(
                  icon:
                      SizedBox(), // Empty icon to make space for floating button
                  label: 'QR',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.history, size: 24),
                  label: 'History',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add, size: 24),
                  label: 'Donate',
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0, // Positioned directly on the edge of the navigation bar
            left:
                MediaQuery.of(context).size.width / 2 - 30, // Center the button
            child: Container(
              width: 60, // Reduced size
              height: 60, // Reduced size
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  Icons.qr_code,
                  color: const Color(0xFFD60030),
                  size: 30, // Reduced icon size
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStatsRow() {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: buildStatCard('Thank You!', '2', 'You did donations'),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 4,
          child: Column(
            children: [
              buildSmallCard('Blood Group', 'O+'),
              const SizedBox(height: 16),
              buildCircularEligibility(),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildStatCard(String title, String value, String subtitle) {
    return Container(
      width: double.infinity,
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
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 78,
              fontWeight: FontWeight.bold,
              color: Color(0xFFD60030),
            ),
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSmallCard(String title, String value) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
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
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
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

  Widget buildCircularEligibility() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
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
        children: [
          const Text(
            'Donation Eligibility',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          CircularPercentIndicator(
            radius: 50,
            lineWidth: 10,
            percent: 0.85,
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
          ),
        ],
      ),
    );
  }

  Widget buildCampaignCard(String location, String imagePath) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.location_on,
                size: 16,
                color: Color(0xFFD60030),
              ),
              const SizedBox(width: 4),
              Text(
                location,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
