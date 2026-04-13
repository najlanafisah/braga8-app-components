import 'package:braga8_app_components/views/daftar-unit/components/table_card.dart';
import 'package:braga8_app_components/widgets/page_header.dart';
import 'package:braga8_app_components/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';
import '../../widgets/main_layouts.dart';

class DaftarUnitScreen extends StatefulWidget {
  const DaftarUnitScreen({super.key});

  @override
  State<DaftarUnitScreen> createState() => _DaftarUnitScreenState();
}

class _DaftarUnitScreenState extends State<DaftarUnitScreen> {
  // 1. Data Dummy Mentah
  final List<Map<String, dynamic>> _allTenants = [
    {"name": "Burger Bangor", "units": 2},
    {"name": "Kopi Kenangan", "units": 1},
    {"name": "Indomaret Fresh", "units": 2},
    {"name": "Solaria", "units": 4},
    {"name": "Hokben", "units": 3},
  ];

  // 2. List hasil filter yang akan ditampilkan di layar
  List<Map<String, dynamic>> _filteredTenants = [];

  // 3. Controller untuk memegang teks pencarian
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Awal buka, tampilkan semua data
    _filteredTenants = _allTenants;
  }

  // 4. Logika Filter Otomatis
  void _filterData(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredTenants = _allTenants;
      } else {
        _filteredTenants = _allTenants
            .where((tenant) =>
                tenant['name'].toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayout(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                PageHeader(
                  title: "Daftar Unit",
                  subtitle: "Braga8 Utility Billing",
                ),

                SizedBox(height: 30),

                // Search Bar dengan Logic Otomatis
                CustomSearchBar(
                  controller: _searchController,
                  hintText: "Search Tenant / Unit...",
                  onChanged: (value) => _filterData(value), // Filter real-time saat ngetik
                  onSearchPressed: () => _filterData(_searchController.text),
                ),

                SizedBox(height: 30),

                // List Data Tabel yang dinamis
                if (_filteredTenants.isEmpty)
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "Data tidak ditemukan",
                        style: TextStyle(color: Colors.white24),
                      ),
                    ),
                  )
                else
                  Column(
                    children: _filteredTenants.map((tenant) {
                      return TableCard(
                        tenantName: tenant['name'],
                        totalUnits: tenant['units'],
                      );
                    }).toList(),
                  ),

                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}