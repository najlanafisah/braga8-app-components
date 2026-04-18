import 'package:braga8_app_components/widgets/action_button_table.dart';
import 'package:braga8_app_components/widgets/status_badge.dart';
import 'package:flutter/material.dart';
import '../../widgets/table_card.dart';
import '../../widgets/page_header.dart';
import '../../widgets/custom_search_bar.dart';
import '../../widgets/main_layouts.dart';

class DaftarUnitScreen extends StatefulWidget {
  const DaftarUnitScreen({super.key});

  @override
  State<DaftarUnitScreen> createState() => _DaftarUnitScreenState();
}

class _DaftarUnitScreenState extends State<DaftarUnitScreen> {
  final List<Map<String, dynamic>> _allTenants = [
    {
      "name": "Burger Bangor",
      "units_list": [
        {"unit": "2A", "floor": "2", "isCheck": true},
        {"unit": "3A", "floor": "2", "isCheck": false},
      ],
    },
    {
      "name": "Kopi Kenangan",
      "units_list": [
        {"unit": "1B", "floor": "1", "isCheck": false},
      ],
    },
    {
      "name": "Indomaret Fresh",
      "units_list": [
        {"unit": "GF1", "floor": "G", "isCheck": true},
        {"unit": "GF5", "floor": "G", "isCheck": true},
      ],
    },
    {
      "name": "Solaria",
      "units_list": [
        {"unit": "3C", "floor": "3", "isCheck": false},
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
                  title: "Daftar Unit",
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
                      suffixText: "${_allTenants.length} Units",
                      main: tenant['name'],
                      columnWidths: {
                        0: FixedColumnWidth(50),
                        1: FixedColumnWidth(50),
                        2: FlexColumnWidth(1.4),
                        3: FlexColumnWidth(1.4),
                        4: FixedColumnWidth(90),
                      },
                      columns: [
                        "Unit",
                        "Floor",
                        "Electricity",
                        "Water",
                        "Actions",
                      ],
                      data: List<Map<String, dynamic>>.from(
                        tenant['units_list'],
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
                        ActionButtonTable(
                          label: item['isCheck'] ? "View" : "Input",
                          icon: item['isCheck'] ? Icons.visibility : Icons.add,
                          color: item['isCheck']
                              ? Colors.blueGrey
                              : Colors.orange,
                          onPressed: () {},
                        ),
                      ],
                    );
                  }),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
