import 'package:flutter/material.dart';
import 'package:suitmedia_test_app/pages/first_page.dart';
import 'package:suitmedia_test_app/pages/second_page.dart';
import 'package:suitmedia_test_app/widgets/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: FirstPage.routePath,
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
