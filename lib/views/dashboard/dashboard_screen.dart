import 'package:braga8_app_components/views/daftar-unit/daftar_unit_screen.dart';
import 'package:flutter/material.dart';
import '../../widgets/bottom_navbar_costom.dart';
import '../../widgets/main_layouts.dart';
import 'components/header_navbar.dart';
import '../../widgets/page_header.dart';
import 'components/summary_card.dart';
import 'components/menu_grid.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayout(
        child: SafeArea(
          child: Column(
            children: [
              HeaderNavbar(),

              Expanded(
                child: IndexedStack(
                  index: _selectedIndex,
                  children: [
                    _buildHomeContent(),
                    Center(
                      child: Text(
                        "Halaman Meter",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DaftarUnitScreen(),
                    Center(
                      child: Text(
                        "Halaman History",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Halaman Profile",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              BottomNavbarCustom(
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHomeContent() {
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
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: MenuGrid(
                      title: "Meter Input",
                      imagePath: "assets/cardImage/meter-input-img.png",
                      onTap: () =>
                          _onItemTapped(1), 
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: MenuGrid(
                      title: "Daftar Unit",
                      imagePath: "assets/cardImage/daftar-unit-img.png",
                      onTap: () =>
                          _onItemTapped(2),
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
                      onTap: () =>
                          _onItemTapped(3),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: MenuGrid(
                      title: "Complaint",
                      imagePath: "assets/cardImage/complaint-img.png",
                      onTap: () =>
                          _onItemTapped(4),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
