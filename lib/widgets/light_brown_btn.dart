import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LightBrownBtn extends StatelessWidget {
  final VoidCallback onTap;
  final String label;

  const LightBrownBtn({super.key, required this.onTap, required this.label});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: AspectRatio(
        aspectRatio: 335 / 70, 
        child: Stack(
          children: [
            Positioned.fill(
              child: SvgPicture.asset(
                'assets/loginbtn.svg',
                fit: BoxFit.fill,
              ),
            ),
            Align(
              alignment: const Alignment(0.0, -0.25), 
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}