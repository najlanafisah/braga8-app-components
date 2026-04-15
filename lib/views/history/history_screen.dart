import 'package:braga8_app_components/views/history/components/pop_up_detail.dart';
import 'package:braga8_app_components/widgets/custom_search_bar.dart';
import 'package:braga8_app_components/widgets/main_layouts.dart';
import 'package:braga8_app_components/widgets/page_header.dart';
import 'package:braga8_app_components/widgets/table_card.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final List<Map<String, dynamic>> _allTenants = [
    {
      "histories_data": [
        {
          "no": "1",
          "name": "Lala",
          "activity": "Added Meter Readings",
          "done at": "8 PM 3/10/2026",
        },
        {
          "no": "2",
          "name": "Najla",
          "activity": "Added Meter Readings",
          "done at": "8 PM 3/10/2026",
        },
        {
          "no": "3",
          "name": "Nana",
          "activity": "Added Meter Readings",
          "done at": "8 PM 3/10/2026",
        },
        {
          "no": "4",
          "name": "Nafish",
          "activity": "Added Meter Readings",
          "done at": "8 PM 3/10/2026",
        },
      ],
    },
  ];

  // Variabel untuk menyimpan baris data yang sudah difilter
  List<Map<String, dynamic>> _filteredHistories = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Inisialisasi awal: ambil semua data dari histories_data pertama
    _filteredHistories = List<Map<String, dynamic>>.from(_allTenants[0]['histories_data']);
  }

  void _filterData(String query) {
    setState(() {
      // Ambil data asli sebagai referensi pencarian
      List<Map<String, dynamic>> allData = List<Map<String, dynamic>>.from(_allTenants[0]['histories_data']);

      if (query.isEmpty) {
        _filteredHistories = allData;
      } else {
        _filteredHistories = allData.where((h) {
          final name = h['name'].toString().toLowerCase();
          final activity = h['activity'].toString().toLowerCase();
          final search = query.toLowerCase();
          
          // Mencari di kolom Nama ATAU kolom Aktivitas
          return name.contains(search) || activity.contains(search);
        }).toList();
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
                  title: "Activity History",
                  subtitle: "Braga8 Utility Billing Management",
                ),
                SizedBox(height: 30),
                CustomSearchBar(
                  controller: _searchController,
                  hintText: "Cari Nama atau Aktivitas...",
                  onChanged: (value) => _filterData(value),
                  onSearchPressed: () => _filterData(_searchController.text),
                ),
                SizedBox(height: 30),

                // Cek jika hasil filter kosong
                if (_filteredHistories.isEmpty)
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
                  // Langsung panggil TableCard satu kali dengan data yang sudah difilter
                  TableCard(
                    main: "History",
                    columns: ["No", "Name", "Activity", "Done At"],
                    data: _filteredHistories,
                    onRowTap: (item) {
                      PopUpDetail.showDetail(
                        context: context,
                        title: "Detail Activity",
                        infoData: [
                          {"label": "Name", "value": item['name']},
                          {"label": "Activity", "value": item['activity']},
                          {"label": "Time", "value": item['done at']},
                        ],
                      );
                    },
                    rowBuilder: (item) => [
                      Text(item['no'], style: TextStyle(color: Colors.white)),
                      Expanded(
                        child: Text(
                          item['name'],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          item['activity'],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Text(
                        item['done at'],
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}