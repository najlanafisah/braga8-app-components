import 'package:flutter/material.dart';
import 'app_colors.dart';

class TextStyles {
  // Title - Bold & Putih Full
  static const TextStyle title = TextStyle(
    fontFamily: 'SFUIDisplay',
    fontWeight: FontWeight.w700, // Bold
    color: AppColors.whiteFull,
    fontSize: 20,
  );

  // Subtitle - Medium & Putih 60%
  static final TextStyle subtitle = TextStyle(
    fontFamily: 'SFUIDisplay',
    fontWeight: FontWeight.w500, // Medium
    color: AppColors.white60,
    fontSize: 14,
  );
}