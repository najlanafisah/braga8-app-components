import 'package:flutter/material.dart';
import 'menu_grid.dart';
import 'summary_card.dart';
import '../../../widgets/page_header.dart';

class DashboardBody extends StatelessWidget {
  final Function(int) onMenuTap;

  const DashboardBody({super.key, required this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            title: "Halo, Jimmy!",
            subtitle: "Braga8 Utility Billing Management",
          ),
          SizedBox(height: 30),
          SummaryCard(current: 46, total: 60, period: "Maret"),
          SizedBox(height: 30),
          _buildMenuGrid(),
          SizedBox(height: 100), // Space buat navbar
        ],
      ),
    );
  }

  Widget _buildMenuGrid() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: MenuGrid(
                title: "Meter Input",
                imagePath: "assets/cardImage/meter-input-img.png",
                onTap: () => onMenuTap(1),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: MenuGrid(
                title: "Daftar Unit",
                imagePath: "assets/cardImage/daftar-unit-img.png",
                onTap: () => onMenuTap(2),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: MenuGrid(
                title: "History",
                imagePath: "assets/cardImage/history-img.png",
                onTap: () => onMenuTap(3),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: MenuGrid(
                title: "Complaint",
                imagePath: "assets/cardImage/complaint-img.png",
                onTap: () => onMenuTap(4),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
