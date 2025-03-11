import 'package:blood_donation_app/widgets/posterContainer.dart';
import 'package:flutter/material.dart';

class SecondContainer extends StatefulWidget {
  const SecondContainer({super.key});

  @override
  State<SecondContainer> createState() => _SecondContainerState();
}

class _SecondContainerState extends State<SecondContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 290, // Original height
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
        child: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      'Blood Donation Campaign Near You',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PosterContainer(
                          location: "Narahenpita",
                          imagePath: "assets/blood_donation_poster_1.jpg",
                        ),
                        PosterContainer(
                          location: "Kalubowila",
                          imagePath: "assets/blood_donation_poster_2.jpeg",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: () {
                  // Add navigation to more campaigns
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => AllCampaignsPage()),
                  // );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xffD60033),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xffD60033).withOpacity(0.3),
                        spreadRadius: 0,
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'See all',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
