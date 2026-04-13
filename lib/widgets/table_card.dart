import 'package:flutter/material.dart';

import '../core/app_colors.dart';

class TableCard extends StatelessWidget {
  final String tenantName;

  final int totalUnits;

  const TableCard({
    super.key,
    required this.tenantName,
    required this.totalUnits,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),

      padding: EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Color(0xFF1E1E1E).withAlpha(150),

        borderRadius: BorderRadius.circular(24),

        border: Border.all(color: AppColors.white40, width: 0.5),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                "Tenant:  $tenantName",

                style: TextStyle(
                  color: Colors.white,

                  fontSize: 16,

                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                "$totalUnits Units",

                style: TextStyle(color: AppColors.white40, fontSize: 14),
              ),
            ],
          ),

          SizedBox(height: 15),

          Divider(color: Colors.white24),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),

            child: Row(
              children: [
                Expanded(flex: 1, child: _HeaderText("Unit")),

                Expanded(flex: 1, child: _HeaderText("Floor")),

                Expanded(flex: 2, child: _HeaderText("Electricity")),

                Expanded(flex: 2, child: _HeaderText("Water")),

                Expanded(flex: 2, child: _HeaderText("Actions")),
              ],
            ),
          ),

          _buildUnitRow("2A", "2", true, true),

          _buildUnitRow("3A", "2", false, false),
        ],
      ),
    );
  }

  Widget _buildUnitRow(
    String unit,

    String floor,

    bool isElecChecked,

    bool isWaterChecked,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),

      child: Row(
        children: [
          Expanded(flex: 1, child: _CellText(unit)),

          Expanded(flex: 1, child: _CellText(floor)),

          Expanded(flex: 2, child: _StatusBadge(isChecked: isElecChecked)),

          Expanded(flex: 2, child: _StatusBadge(isChecked: isWaterChecked)),

          Expanded(
            flex: 2,

            child: _ActionButton(isChecked: isElecChecked && isWaterChecked),
          ),
        ],
      ),
    );
  }
}

class _HeaderText extends StatelessWidget {
  final String text;

  const _HeaderText(this.text);

  @override
  Widget build(BuildContext context) => Text(
    text,

    style: TextStyle(
      color: Colors.white70,

      fontSize: 12,

      fontWeight: FontWeight.bold,
    ),
  );
}

class _CellText extends StatelessWidget {
  final String text;

  const _CellText(this.text);

  @override
  Widget build(BuildContext context) =>
      Text(text, style: TextStyle(color: Colors.white, fontSize: 13));
}

class _StatusBadge extends StatelessWidget {
  final bool isChecked;

  const _StatusBadge({required this.isChecked});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    final LinearGradient gradient = isChecked
        ? LinearGradient(
            begin: Alignment.topCenter,

            end: Alignment.bottomCenter,

            colors: [Color(0xFF3B4A30), Color(0xFF636B5E)],
          )
        : LinearGradient(
            begin: Alignment.topCenter,

            end: Alignment.bottomCenter,

            colors: [Color(0xFF4B2F31), Color(0xFF5F4A4B)],
          );

    return Container(
      margin: EdgeInsets.only(right: 6),

      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),

      decoration: BoxDecoration(
        gradient: gradient,

        borderRadius: BorderRadius.circular(20),

        border: Border.all(color: AppColors.white60, width: 0.5),
      ),

      child: Text(
        isChecked ? "Checked" : "Unchecked",

        textAlign: TextAlign.center,

        style: TextStyle(
          color: Colors.white70,

          fontSize: screenWidth < 380 ? 8 : 10,

          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final bool isChecked;

  const _ActionButton({required this.isChecked});

  @override
  Widget build(BuildContext context) {
    // Definisi warna berdasarkan status

    final baseColor = isChecked ? Color(0xFFC48634) : Color(0xFF69635C);

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),

      child: Stack(
        children: [
          // 1. Positioned Fill untuk Background Warna (28% Opacity)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                // Menggunakan withValues(alpha: 0.28) sesuai request 28%
                color: baseColor.withValues(alpha: 0.28),
              ),
            ),
          ),

          // 2. Positioned Fill untuk Border Tipis (Mirip SearchBar)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),

                border: Border.all(color: AppColors.white60, width: 0.5),
              ),
            ),
          ),

          // 3. Konten Utama (Icon & Text)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 6),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Icon(
                  isChecked ? Icons.visibility : Icons.add,
                  size: 14,
                  color: Colors.white.withValues(alpha: 0.9),
                ),

                SizedBox(width: 4),

                Text(
                  isChecked ? "View" : "Input",

                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
