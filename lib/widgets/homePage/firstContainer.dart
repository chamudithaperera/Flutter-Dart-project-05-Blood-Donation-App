import 'package:flutter/material.dart';

class FirstContainer extends StatefulWidget {
  const FirstContainer({super.key});

  @override
  State<FirstContainer> createState() => _FirstContainerState();
}

class _FirstContainerState extends State<FirstContainer> {
  // Total days between donations
  final int totalDaysBetweenDonations =
      56; // Typical waiting period for blood donation

  // Current days remaining until eligible
  int daysRemaining =
      20; // This can be updated dynamically from your data source

  // Calculate progress value (0.0 to 1.0)
  double get eligibilityProgress {
    // Calculate days elapsed
    int daysElapsed = totalDaysBetweenDonations - daysRemaining;

    // Calculate progress (0.0 to 1.0)
    return daysElapsed / totalDaysBetweenDonations;
  }

  // Method to update days remaining
  void updateDaysRemaining(int newDays) {
    setState(() {
      daysRemaining = newDays;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //container 01 ----------------------
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'Donation Eligibility',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                letterSpacing: -0.3,
                              ),
                            ),
                          ),

                          // Indicator
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                const SizedBox(
                                  width: 120, // Adjust the size as needed
                                  height: 120, // Adjust the size as needed
                                  child: CircularProgressIndicator(
                                    value: 1,
                                    strokeWidth: 16,
                                    backgroundColor: Color(0xFFF5E6EA),
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Color(0xFFF5E6EA),
                                    ),
                                  ),
                                ),

                                // Progress indicator
                                SizedBox(
                                  width: 120, // Match the same size
                                  height: 120, // Match the same size
                                  child: CircularProgressIndicator(
                                    value: eligibilityProgress,
                                    strokeWidth: 16,
                                    backgroundColor: Colors.transparent,
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                      Color(0xFFD60033),
                                    ),
                                  ),
                                ),

                                Column(
                                  children: [
                                    Text(
                                      daysRemaining == 0
                                          ? 'Ready'
                                          : 'Eligible in',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black.withOpacity(0.6),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      daysRemaining == 0
                                          ? 'now'
                                          : '$daysRemaining days',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    //container 02 ----------------------

                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 80,
                          width: 160,
                          decoration: BoxDecoration(
                            color: Colors.white,
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
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Blood Group',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                Text(
                                  'O+',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28,
                                      color: Color(0xFFD60033)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        //container 03 ----------------------

                        Container(
                          height: 110, // Increased height to prevent overflow
                          width: 160,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.06),
                                spreadRadius: 0,
                                blurRadius: 20,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 70,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xFFD60033),
                                ),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '2',
                                      style: TextStyle(
                                          fontSize: 50,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      'Times',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              const Text(
                                'You did donations',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
