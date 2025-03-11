import 'package:flutter/material.dart';

class AddFilePage extends StatelessWidget {
  const AddFilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New File'),
      ),
      body: const Center(
        child: Text(
          'Add New File Page Content',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
