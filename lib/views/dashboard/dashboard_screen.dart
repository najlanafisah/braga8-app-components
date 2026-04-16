import 'package:braga8_app_components/views/history/history_screen.dart';
import 'package:braga8_app_components/views/list-komplain/complains_screen.dart';
import 'package:braga8_app_components/views/meter-input/meter_input_screen.dart';
import 'package:flutter/material.dart';
import '../../widgets/bottom_navbar_costom.dart';
import '../../widgets/main_layouts.dart';
import '../daftar-unit/daftar_unit_screen.dart';
import 'components/dashboard_body.dart';

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
    // List halaman dipisah di sini agar build method tetap bersih
    final List<Widget> pages = [
      DashboardBody(onMenuTap: _onItemTapped),
      MeterInputScreen(),
      DaftarUnitScreen(),
      HistoryScreen(),
      ComplainsScreen()
    ];

    return Scaffold(
      body: MainLayout(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: IndexedStack(index: _selectedIndex, children: pages),
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
}
