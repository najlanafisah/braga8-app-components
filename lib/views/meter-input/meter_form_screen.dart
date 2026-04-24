import 'dart:io';
import 'package:braga8_app_components/views/complain/components/add_media.dart';
import 'package:braga8_app_components/views/complain/components/input_form.dart';
import 'package:braga8_app_components/widgets/light_brown_btn.dart';
import 'package:braga8_app_components/widgets/main_layouts.dart';
import 'package:braga8_app_components/widgets/success_modal.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:braga8_app_components/services/image_service.dart';
import 'package:permission_handler/permission_handler.dart';

class MeterFormScreen extends StatefulWidget {
  final String tenantName;
  final Map<String, dynamic> unitData;

  const MeterFormScreen({
    super.key,
    required this.tenantName,
    required this.unitData,
  });

  @override
  State<MeterFormScreen> createState() => _MeterFormScreenState();
}

class _MeterFormScreenState extends State<MeterFormScreen> {
  final ImageService _imageService = ImageService();
  File? _imageFile;

  Future<void> _handlePickImage() async {
    if (!kIsWeb) {
      var status = await Permission.camera.request();
      if (!status.isGranted) return;
    }

    File? file = await _imageService.pickImage(fromGallery: kIsWeb);

    if (file != null) {
      setState(() {
        _imageFile = file;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: MainLayout(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SafeArea(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: constraints.maxHeight),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 95), 
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFC5A358),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white.withValues(alpha: .3)),
                            ),
                            child: const Text(
                              "Electricity",
                              style: TextStyle(color: Color(0xFF3D3526), fontSize: 11, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            widget.tenantName,
                            style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Unit ${widget.unitData['unit']}",
                            style: const TextStyle(color: Colors.white38, fontSize: 16),
                          ),
                          const SizedBox(height: 32),
                          const InputForm(label: "Meter"),
                          const SizedBox(height: 20),
                          const InputForm(label: "Reading Value"),
                          const SizedBox(height: 20),
                          AddMedia(
                            label: "Bukti Meter",
                            onPickImage: _handlePickImage,
                            btnText: _imageFile == null ? 'Ambil Foto' : 'Ganti Foto',
                            imageFile: _imageFile,
                          ),
                          const SizedBox(height: 110), 
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 20,
                    right: 20,
                    child: LightBrownBtn(
                      onTap: () {
                        SuccessModal.show(
                          context,
                          title: "Berhasil di Tambahkan!",
                          onConfirm: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                        );
                      },
                      label: 'Tambahkan',
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}