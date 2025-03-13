import 'package:flutter/material.dart';

class FourthContainer extends StatelessWidget {
  const FourthContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.info_outline,
                color: Color(0xFFD60033),
                size: 22,
              ),
              SizedBox(width: 10),
              Text(
                'Donation Resources',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // National Blood Transfusion Service
          _buildResourceItem(
            title: 'National Blood Transfusion Service',
            subtitle: 'Central Blood Bank - Colombo',
            icon: Icons.local_hospital,
          ),

          _buildDivider(),

          // Hotline
          _buildResourceItem(
            title: 'Blood Donation Hotline',
            subtitle: '011-2369931-4',
            icon: Icons.phone,
          ),

          _buildDivider(),

          // Emergency Contact
          _buildResourceItem(
            title: 'Emergency Blood Requests',
            subtitle: '011-2369937',
            icon: Icons.emergency,
          ),

          _buildDivider(),

          // Email Contact
          _buildResourceItem(
            title: 'Email Inquiries',
            subtitle: 'info@nbts.health.gov.lk',
            icon: Icons.email,
          ),

          _buildDivider(),

          // Blood Bank Locations Section
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5E6EA),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.location_on,
                    color: Color(0xFFD60033),
                    size: 22,
                  ),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Text(
                    'Blood Bank Locations',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Blood Bank Locations List as a modern 4x2 table with Address and Contact
          Container(
            margin: const EdgeInsets.only(top: 8, bottom: 20),
            child: Table(
              border: TableBorder.all(
                color: Colors.black.withOpacity(0.1),
                width: 1,
              ),
              columnWidths: const {
                0: const FlexColumnWidth(2),
                1: const FlexColumnWidth(2),
                2: const FlexColumnWidth(1.5),
              },
              children: [
                TableRow(
                  children: [
                    _buildLocationCell('National Blood Centre'),
                    _buildLocationCell('011-2369931'),
                  ],
                ),
                TableRow(
                  children: [
                    _buildLocationCell('Kandy Blood Bank'),
                    _buildLocationCell('081-2223344'),
                  ],
                ),
                TableRow(
                  children: [
                    _buildLocationCell('Galle Blood Bank'),
                    _buildLocationCell('091-2234567'),
                  ],
                ),
                TableRow(
                  children: [
                    _buildLocationCell('Jaffna Blood Bank'),
                    _buildLocationCell('021-2345678'),
                  ],
                ),
                TableRow(
                  children: [
                    _buildLocationCell('Anuradhapura Blood Bank'),
                    _buildLocationCell('025-2233445'),
                  ],
                ),
                TableRow(
                  children: [
                    _buildLocationCell('Badulla Blood Bank'),
                    _buildLocationCell('055-2233445'),
                  ],
                ),
                TableRow(
                  children: [
                    _buildLocationCell('Kurunegala Blood Bank'),
                    _buildLocationCell('037-2233445'),
                  ],
                ),
                TableRow(
                  children: [
                    _buildLocationCell('Ratnapura Blood Bank'),
                    _buildLocationCell('045-2233445'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResourceItem({
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF5E6EA),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: const Color(0xFFD60033),
              size: 22,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.black.withOpacity(0.1),
      height: 1,
    );
  }

  Widget _buildLocationCell(String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Column(
        children: [
          Text(
            content,
            textAlign: TextAlign.center, // Centered for better alignment
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 11, // Smaller text for better readability
              color: Colors.black.withOpacity(0.6), // Softer text color
            ),
          ),
        ],
      ),
    );
  }
}
