import 'package:braga8_app_components/views/complain/components/view_media.dart';
import 'package:braga8_app_components/views/meter-input/components/meter_info_card.dart';
import 'package:braga8_app_components/widgets/light_brown_btn.dart';
import 'package:braga8_app_components/widgets/main_layouts.dart';
import 'package:flutter/material.dart';

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
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildMainCard(),
                      SizedBox(height: 40),
                      ViewMedia(
                        label: "Bukti meter",
                        imagePath: "../../../assets/meter-sample.png",
                      ),
                      SizedBox(height: 20),
                      _buildLogPanel(),
                      SizedBox(height: 80),
                      LightBrownBtn(
                        onTap: () => Navigator.pop(context),
                        label: "Kembali",
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildMainCard() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withValues(alpha: 0.05),
            Color(0xFFE54900).withValues(alpha: 0.1),
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
                    "Unit ${unitData['unit']}",
                    style: TextStyle(color: Colors.white38, fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    tenantName,
                    style: TextStyle(
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
          SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: MeterInfoCard(
                  title: "Meter Number",
                  value: "28",
                  imagePath:
                      "../../../assets/cardImage/daftar_unit_view_img.png",
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: MeterInfoCard(
                  title: "Reading Value",
                  value: "280",
                  isKwh: true,
                  imagePath: "../../../assets/cardImage/reading_value_img.png",
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
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: Color(0xFF231712),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.white.withValues(alpha: .1)),
      ),
      child: Row(
        children: [
          SizedBox(width: 8),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: .2),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                "i",
                style: TextStyle(
                  color: Color(0xFF121212),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: 'Serif',
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
          _logItem("Month", "January"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: _vDivider(),
          ),
          _logItem("Input Date", "12/4/2026"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: _vDivider(),
          ),
          _logItem("Geo Tagging", "-349040.3045"),
        ],
      ),
    );
  }

  Widget _buildBadge() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Color(0xFFC5A358),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: .3)),
      ),
      child: Text(
        "Electricity",
        style: TextStyle(
          color: Color(0xFF3D3526),
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
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
          style: TextStyle(
            color: Colors.white.withValues(alpha: .4),
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _vDivider() => Container(height: 30, width: 1, color: Colors.white12);
}
