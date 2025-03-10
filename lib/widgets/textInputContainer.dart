import 'package:flutter/material.dart';

class TextInputContainer extends StatelessWidget {
  const TextInputContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xff000000), width: 2),
      ),
      child: const Row(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Icon(Icons.vpn_key),
          ),
          Expanded(
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: "NIC Number",
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 15,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
