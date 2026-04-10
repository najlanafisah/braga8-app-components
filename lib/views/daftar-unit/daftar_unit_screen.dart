import 'package:braga8_app_components/widgets/main_layouts.dart';
import 'package:braga8_app_components/widgets/page_header.dart';
import 'package:flutter/material.dart';

class DaftarUnitScreen extends StatefulWidget {
  const DaftarUnitScreen({super.key});

  @override
  State<DaftarUnitScreen> createState() => _DaftarUnitScreenState();
}

class _DaftarUnitScreenState extends State<DaftarUnitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayout(
        child: Column(
          children: [
            PageHeader(
              title: "Daftar Unit",
              subtitle: "Braga8 Utility Billing Management "
            )
          ],
        ),
      ),
    );
  }
}