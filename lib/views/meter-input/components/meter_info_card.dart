import 'package:flutter/material.dart';

class MeterInfoCard extends StatelessWidget {
  final String title;
  final String value;
  final String imagePath; 
  final bool isKwh;

  const MeterInfoCard({
    super.key,
    required this.title,
    required this.value,
    required this.imagePath,
    this.isKwh = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .03),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: .05)),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: Colors.white60, fontSize: 14)),
                SizedBox(height: 2),
                Row(
                  children: [
                    if (isKwh) ...[Icon(Icons.bolt, color: Colors.white, size: 28), SizedBox(width: 4)],
                    Text(value, style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                    if (isKwh) Text(" kWh", style: TextStyle(color: Colors.white38, fontSize: 14)),
                  ],
                ),
              ],
            ),
          ),

          Positioned(
            top: 80, 
            right: 0, 
            child: SizedBox(
              height: 160, 
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                alignment: Alignment.bottomRight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}