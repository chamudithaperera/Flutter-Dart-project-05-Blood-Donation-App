import 'package:flutter/material.dart';

class QRCodePage extends StatelessWidget {
  const QRCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code'),
        backgroundColor: const Color(0xFFD60030),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.qr_code_scanner),
              label: const Text('Scan QR'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD60030),
                minimumSize: const Size(200, 50),
              ),
              onPressed: () {
                // TODO: Implement QR code scanning functionality
                _showScanQRDialog(context);
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.qr_code),
              label: const Text('My QR'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD60030),
                minimumSize: const Size(200, 50),
              ),
              onPressed: () {
                _showMyQRDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showScanQRDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Scan QR'),
          content: const Text('QR Code scanning functionality will be implemented here.'),
          actions: [
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showMyQRDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('My QR Code'),
          content: Container(
            width: 250,
            height: 250,
            color: Colors.white,
            child: const Center(
              child: Text(
                'QR Code Placeholder',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  color: Color(0xFFD60030),
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}