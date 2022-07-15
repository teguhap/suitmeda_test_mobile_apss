import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suitmedia_test_app/common/my_color.dart';
import 'package:suitmedia_test_app/common/my_typography.dart';

class MyTextField extends StatelessWidget {
  final String text;
  final TextEditingController textController;

  MyTextField({
    required this.text,
    required this.textController,
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        fillColor: Colors.white,
        filled: true,
        hintText: text,
        hintStyle: TextStyle(
            color: MyColor.hintTextColor,
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.w500,
            fontSize: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: MyColor.secondaryActive),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: MyColor.secondaryActive),
        ),
      ),
    );
  }
}
