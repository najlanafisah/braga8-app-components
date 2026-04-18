import 'dart:io';
import 'package:flutter/material.dart';

class AddMedia extends StatelessWidget {
  final String label;
  final File? selectedImage;
  final VoidCallback onPickImage;

  const AddMedia({
    super.key,
    required this.label,
    this.selectedImage,
    required this.onPickImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 8),
        GestureDetector(
          onTap: onPickImage,
          child: Container(
            width: double.infinity,
            height: 220,
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.15),
                width: 2,
              ),
              image: selectedImage != null
                  ? DecorationImage(
                      image: FileImage(selectedImage!),
                      fit: BoxFit.cover,
                    )
                  : DecorationImage(
                      image: AssetImage('assets/checkered-bg.png'),
                      fit: BoxFit.cover,
                      opacity: 0.7,
                    ),
            ),
            // Jika belum ada foto, tampilkan tombol "+ Add"
            child: selectedImage == null
                ? Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
                      ),
                      child: Text(
                        "+ Add", // Sesuai dengan screenshot image_acbce8
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                : Container(),
          ),
        ),
      ],
    );
  }
}