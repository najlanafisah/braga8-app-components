import 'package:flutter/material.dart';
import 'package:braga8_app_components/widgets/action_button.dart';
import 'package:braga8_app_components/widgets/status_badge.dart';
import '../../widgets/table_card.dart';
import '../../widgets/page_header.dart';
import '../../widgets/custom_search_bar.dart';
import '../../widgets/main_layouts.dart';

class MeterInputScreen extends StatefulWidget {
  const MeterInputScreen({super.key});

  @override
  State<MeterInputScreen> createState() => _MeterInputScreenState();
}

class _MeterInputScreenState extends State<MeterInputScreen> {
  final List<Map<String, dynamic>> _allTenants = [
    {
      "name": "Burger Bangor",
      "units_data": [
        {"unit": "2A", "floor": "2", "isCheck": true},
        {"unit": "3A", "floor": "2", "isCheck": false},
      ],
    },
    {
      "name": "Kopi Kenangan",
      "units_data": [
        {"unit": "1B", "floor": "1", "isCheck": false},
      ],
    },
    {
      "name": "Indomaret Fresh",
      "units_data": [
        {"unit": "GF1", "floor": "G", "isCheck": true},
        {"unit": "GF2", "floor": "G", "isCheck": true},
      ],
    },
    {
      "name": "Solaria",
      "units_data": [
        {"unit": "4C", "floor": "4", "isCheck": false},
      ],
    },
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
                  ..._filteredTenants.map((tenant) {
                    return TableCard(
                      prefix: "Tenant:",
                      main: tenant['name'],
                      columns: [
                        "Unit",
                        "Floor",
                        "Electricity",
                        "Water",
                        "Actions",
                      ],
                      data: List<Map<String, dynamic>>.from(
                        tenant['units_data'],
                      ),
                      rowBuilder: (item) => [
                        Text(
                          item['unit'],
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          item['floor'],
                          style: TextStyle(color: Colors.white),
                        ),
                        StatusBadge(isChecked: item['isCheck']),
                        StatusBadge(isChecked: false),
                        ActionButton(
                          label: item['isCheck'] ? "View" : "Input",
                          icon: item['isCheck'] ? Icons.visibility : Icons.add,
                          color: item['isCheck']
                              ? Colors.blueGrey
                              : Colors.orange,
                          onPressed: () {
                          },
                        ),
                      ],
                    );
                  }),
                SizedBox(height: 50), 
              ],
            ),
          ),
        ),
      ),
    );
  }
}
