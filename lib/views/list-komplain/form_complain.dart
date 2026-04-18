import 'package:braga8_app_components/views/list-komplain/components/add_media.dart';
import 'package:braga8_app_components/views/list-komplain/edit-laporan/components/input_form.dart';
import 'package:braga8_app_components/widgets/light_brown_btn.dart';
import 'package:braga8_app_components/widgets/main_layouts.dart';
import 'package:braga8_app_components/widgets/success_modal.dart';
import 'package:flutter/material.dart';

class FormComplain extends StatefulWidget {
  const FormComplain({super.key});

  @override
  State<FormComplain> createState() => _FormComplainState();
}

class _FormComplainState extends State<FormComplain> {

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title Section
                Text(
                  'Lapor Komplain',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                    'Braga8',
                    style: TextStyle(
                      fontSize: 14, 
                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                    ),
                  ),
                SizedBox(height: 32),
              
                InputForm(
                  label: "Pasal Komplain",
                  maxLines: 1,
                ),
              
                SizedBox(height: 20),
              
                InputForm(
                  label: "Keterangan",
                  maxLines: 3,
                ),
              
                SizedBox(height: 20),
              
                AddMedia(label: "Foto Komplain (Opsional)", onPickImage: () {}),
                SizedBox(height: 40),
                LightBrownBtn(
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildInputField() {
    return TextField(
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFE5D1C9),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}