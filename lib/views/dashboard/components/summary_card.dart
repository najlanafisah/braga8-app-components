import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';
import '../../../core/app_theme.dart';

class SummaryCard extends StatelessWidget {
  final int current;
  final int total;
  final String period;

  const SummaryCard({
    super.key,
    required this.current,
    required this.total,
    required this.period,
  });

  @override
  Widget build(BuildContext context) {
    // Menghitung persentase untuk Progress Bar (0.0 - 1.0)
    double progressValue = current / total;
    // Menghitung persentase untuk teks (0 - 100)
    int percentageText = ((current / total) * 100).toInt();

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primaryOrange.withAlpha(4),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.white40, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Progress Input Meter", style: AppTextStyles.subtitle),
              Container(
                
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white12,
                  border: Border.all(color: AppColors.primaryOrange),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  period,
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.primaryOrange,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 6),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    "$current",
                    style: AppTextStyles.title.copyWith(
                      fontSize: 60,
                      color: AppColors.primaryOrange,
                    ),
                  ),
                  Text(
                    " /$total",
                    style: AppTextStyles.title.copyWith(
                      fontSize: 40,
                      color: AppColors.white40,
                    ),
                  ),
                  SizedBox(width: 4),
                  Text("Unit", style: AppTextStyles.caption),
                ],
              ),

              Text(
                "$percentageText%",
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.white60, // Pakai opacity 60% agar manis
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          Stack(
            children: [
              Container(
                height: 6,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.white40,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                widthFactor: progressValue > 1.0 ? 1.0 : progressValue,
                child: Container(
                  height: 6,
                  decoration: BoxDecoration(
                    color: AppColors.primaryOrange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
