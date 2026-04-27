import 'package:flutter/material.dart';
import '../../../core/app_colors.dart'; // Pastikan path ini sesuai dengan project kamu

// 1. Class Konfigurasi Responsif
class NavbarSizeConfig {
  final double screenWidth;
  NavbarSizeConfig(this.screenWidth);

  // Tinggi navbar menyesuaikan layar
  double get navHeight {
    if (screenWidth < 360) return 58;
    if (screenWidth < 480) return 64;
    return 70;
  }

  // Padding horizontal luar navbar (margin dari tepi layar)
  double get outerPadding => screenWidth * 0.055;

  // Padding horizontal di dalam item yang sedang aktif
  double get activePadH {
    if (screenWidth < 360) return 12;
    if (screenWidth < 480) return 16;
    return 20;
  }

  // Padding horizontal di dalam item yang tidak aktif
  double get inactivePadH => screenWidth < 360 ? 8 : 12;

  // Ukuran icon responsif
  double get iconSize => screenWidth < 360 ? 20 : 24;

  // Ukuran font responsif
  double get fontSize => screenWidth < 360 ? 12 : 14;
}

// 2. Widget Utama Bottom Navbar
class BottomNavbarCustom extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavbarCustom({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Mengambil lebar layar aktual menggunakan MediaQuery
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final cfg = NavbarSizeConfig(screenWidth);

    return Padding(
      padding: EdgeInsets.fromLTRB(
        cfg.outerPadding, 
        0, 
        cfg.outerPadding, 
        16, // Jarak dari bawah layar
      ),
      child: Container(
        height: cfg.navHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          image: const DecorationImage(
            image: AssetImage('assets/navbar-img.png'),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _navItem(0, Icons.home_filled, "Home", cfg),
            _navItem(1, Icons.speed, "Meter", cfg),
            _navItem(2, Icons.list_alt_rounded, "List", cfg),
            _navItem(3, Icons.history, "History", cfg),
            _navItem(4, Icons.feedback, "Report", cfg),
          ],
        ),
      ),
    );
  }

  Widget _navItem(
    int index,
    IconData icon,
    String label,
    NavbarSizeConfig cfg,
  ) {
    bool isActive = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(
          horizontal: isActive ? cfg.activePadH : cfg.inactivePadH,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: isActive 
              ? Colors.white.withAlpha(200) 
              : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isActive
                  ? AppColors.primaryOrange
                  : Colors.white.withAlpha(180),
              size: cfg.iconSize,
            ),
            if (isActive) ...[
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color: AppColors.primaryOrange,
                  fontWeight: FontWeight.bold,
                  fontSize: cfg.fontSize,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}