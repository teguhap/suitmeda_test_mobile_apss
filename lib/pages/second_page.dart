import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:suitmedia_test_app/common/my_color.dart';
import 'package:suitmedia_test_app/common/my_typography.dart';
import 'package:suitmedia_test_app/pages/third_page.dart';
import 'package:suitmedia_test_app/widgets/my_button.dart';

class SecondPage extends StatefulWidget {
  static const routePath = '/secondPage';
  final String userName;

  SecondPage({required this.userName});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String userSelected = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Second Screen',
          style: MyTypography.titleH2.copyWith(
            color: MyColor.darkBlack,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            color: Color(0xff554AF0),
            iconSize: 18,
            onPressed: (() => Navigator.pop(context))),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome"),
            Text(
              widget.userName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Center(
                child: Text(
                    (userSelected == "") ? "Selected User Name" : userSelected,
                    style: MyTypography.titleH2.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            MyButton(
              text: 'Choose a User',
              onTap: () async {
                var userData = await Navigator.of(context).pushNamed(
                  ThirdPage.routePath,
                );
                setState(() {
                  userSelected = (userData != null) ? userData.toString() : "";
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
