import 'package:flutter/material.dart';
import 'package:suitmedia_test_app/common/my_color.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Function()? onTap;

  MyButton({required this.text, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: MyColor.blueButton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(text),
        ),
        onPressed: onTap,
      ),
    );
  }
}
