import 'package:braga8_app_components/views/complain/components/add_media.dart';
import 'package:braga8_app_components/views/complain/components/input_form.dart';
import 'package:braga8_app_components/widgets/light_brown_btn.dart';
import 'package:braga8_app_components/widgets/main_layouts.dart';
import 'package:braga8_app_components/widgets/success_modal.dart';
import 'package:flutter/material.dart';

class AddComplainScreen extends StatefulWidget {
  const AddComplainScreen({super.key});

  @override
  State<AddComplainScreen> createState() => _AddComplainScreenState();
}

class _AddComplainScreenState extends State<AddComplainScreen> {

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
}