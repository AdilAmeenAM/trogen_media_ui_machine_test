import 'package:flutter/material.dart';

class SubscriptionPlanTabWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  const SubscriptionPlanTabWidget(
      {super.key, required this.isSelected, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected
                ? const Color(0xFFB45AF9)
                : Colors.white.withOpacity(0.7),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
