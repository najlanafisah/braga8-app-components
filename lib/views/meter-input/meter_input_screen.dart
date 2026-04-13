import 'package:flutter/material.dart';
import 'package:braga8_app_components/widgets/table_card.dart';
import 'package:braga8_app_components/widgets/page_header.dart';
import 'package:braga8_app_components/widgets/custom_search_bar.dart';
import '../../widgets/main_layouts.dart';

class MeterInputScreen extends StatefulWidget {
  const MeterInputScreen({super.key});

  @override
  State<MeterInputScreen> createState() => _MeterInputScreenState();
}

class _MeterInputScreenState extends State<MeterInputScreen> {
  final List<Map<String, dynamic>> _allTenants = [
    {"name": "Burger Bangor", "units": 2},
    {"name": "Kopi Kenangan", "units": 1},
    {"name": "Indomaret Fresh", "units": 2},
    {"name": "Solaria", "units": 4},
    {"name": "Hokben", "units": 3},
  ];

  List<Map<String, dynamic>> _filteredTenants = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredTenants = _allTenants;
  }

  void _filterData(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredTenants = _allTenants;
      } else {
        _filteredTenants = _allTenants
            .where(
              (tenant) =>
                  tenant['name'].toLowerCase().contains(query.toLowerCase()),
            )
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
                  title: "Meter Input",
                  subtitle: "Braga8 Utility Billing Management",
                ),
                SizedBox(height: 30),
                CustomSearchBar(
                  controller: _searchController,
                  hintText: "Cari Tenant / Unit...",
                  onChanged: (value) => _filterData(value),
                  onSearchPressed: () => _filterData(_searchController.text),
                ),
                SizedBox(height: 30),
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
