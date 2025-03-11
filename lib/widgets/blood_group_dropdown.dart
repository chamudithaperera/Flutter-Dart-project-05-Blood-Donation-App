import 'package:flutter/material.dart';

class BloodGroupDropdown extends StatefulWidget {
  final String? selectedBloodGroup;
  final Function(String?) onChanged;

  const BloodGroupDropdown({
    Key? key,
    this.selectedBloodGroup,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<BloodGroupDropdown> createState() => _BloodGroupDropdownState();
}

class _BloodGroupDropdownState extends State<BloodGroupDropdown> {
  final List<String> _bloodGroups = [
    "A+",
    "A-",
    "B+",
    "B-",
    "O+",
    "O-",
    "AB+",
    "AB-"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: DropdownButtonHideUnderline(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: DropdownButton<String>(
            value: widget.selectedBloodGroup,
            hint: Row(
              children: [
                Icon(
                  Icons.bloodtype_outlined,
                  color: const Color(0xFFD60033).withOpacity(0.7),
                ),
                const SizedBox(width: 12),
                const Text(
                  "Select Blood Group",
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            isExpanded: true,
            icon: const Icon(Icons.arrow_drop_down, color: Colors.black54),
            iconSize: 28,
            borderRadius: BorderRadius.circular(12),
            items: _bloodGroups.map((String bloodGroup) {
              return DropdownMenuItem<String>(
                value: bloodGroup,
                child: Text(
                  bloodGroup,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              );
            }).toList(),
            onChanged: widget.onChanged,
          ),
        ),
      ),
    );
  }
}
