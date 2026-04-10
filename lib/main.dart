import 'package:flutter/material.dart';
import 'views/dashboard/dashboard_screen.dart';

void main() {
  runApp(const Braga8App());
}

class Braga8App extends StatelessWidget {
  const Braga8App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Braga 8 Admin',
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(), 
    );
  }
}