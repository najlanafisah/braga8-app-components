import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Menggunakan backgroundColor di Scaffold juga bisa sebagai dasar
      backgroundColor: Color(0xFF141315), 
      body: Stack(
        children: [
          // Background Image dengan warna cadangan
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF141315), // Warna #141315
              image: DecorationImage(
                image: AssetImage('assets/app-background.png'),
                fit: BoxFit.cover,
                // Tambahkan opacity kalau mau gambarnya agak gelap/blend dengan warna bg
                opacity: 0.8, 
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}