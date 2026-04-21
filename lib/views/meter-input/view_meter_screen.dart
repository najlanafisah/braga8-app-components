import 'package:braga8_app_components/views/complain/components/view_media.dart';
import 'package:braga8_app_components/views/meter-input/components/meter_info_card.dart';
import 'package:braga8_app_components/widgets/main_layouts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ViewMeterScreen extends StatelessWidget {
  final String tenantName;
  final Map<String, dynamic> unitData;

  const ViewMeterScreen({
    super.key,
    required this.tenantName,
    required this.unitData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: MainLayout(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  // --- AREA KONTEN (SCROLLABLE) ---
                  SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: constraints.maxHeight),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // INI YANG DIUBAH: Jarak dari paling atas ke card pertama ditambah 
                          // biar posisi seluruh konten turun sedikit
                          const SizedBox(height: 40), 

                          _buildMainCard(),
                          const SizedBox(height: 40),
                          const ViewMedia(
                            label: "Bukti meter",
                            imagePath: "assets/meter-sample.png",
                          ),
                          const SizedBox(height: 40), 
                          _buildLogPanel(),
                          
                          // Spacer bawah agar konten tidak tertutup button "Kembali"
                          const SizedBox(height: 140), 
                        ],
                      ),
                    ),
                  ),

                  // --- BUTTON KEMBALI (FIXED/STICKY DI BAWAH) ---
                  Positioned(
                    bottom: 30,
                    left: 20,
                    right: 20,
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      borderRadius: BorderRadius.circular(12),
                      child: AspectRatio(
                        aspectRatio: 335 / 70, 
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: SvgPicture.asset(
                                'assets/loginbtn.svg',
                                fit: BoxFit.fill, 
                              ),
                            ),
                            Align(
                              alignment: const Alignment(0.0, -0.2), 
                              child: const Text(
                                "Kembali",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildMainCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withValues(alpha: 0.05),
            const Color(0xFFE54900).withValues(alpha: 0.1),
          ],
          stops: const [0.3, 1.0],
        ),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Unit ${unitData['unit'] ?? '-'}", 
                    style: const TextStyle(color: Colors.white38, fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    tenantName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              _buildBadge(),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: MeterInfoCard(
                  title: "Meter Number",
                  value: "28",
                  imagePath: "assets/cardImage/daftar_unit_view_img.png",
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: MeterInfoCard(
                  title: "Reading Value",
                  value: "280",
                  isKwh: true,
                  imagePath: "assets/cardImage/reading_value_img.png",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLogPanel() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: const Color(0xFF231712),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.white.withValues(alpha: .1)),
      ),
      child: Row(
        children: [
          const SizedBox(width: 8),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: .2),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                "i",
                style: TextStyle(color: Color(0xFF121212), fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
          const SizedBox(width: 16),
          _logItem("Month", "January"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: _vDivider(),
          ),
          _logItem("Input Date", "12/4/2026"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: _vDivider(),
          ),
          _logItem("Geo Tagging", "-349040.3045"),
        ],
      ),
    );
  }

  Widget _buildBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFC5A358),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: .3)),
      ),
      child: const Text(
        "Electricity",
        style: TextStyle(color: Color(0xFF3D3526), fontSize: 10, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _logItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.white.withValues(alpha: .4), fontSize: 11, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _vDivider() => Container(height: 30, width: 1, color: Colors.white12);
}