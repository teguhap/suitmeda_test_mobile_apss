import 'package:flutter/material.dart';
import 'package:suitmedia_test_app/pages/first_page.dart';
import 'package:suitmedia_test_app/pages/second_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case FirstPage.routePath:
        return MaterialPageRoute(
          builder: (_) => FirstPage(),
        );
      case SecondPage.routePath:
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => SecondPage(userName: args),
          );
        }
        return errorRoute();
      default:
        return errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Text('Terjadi Kesalahan'),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(_);
                    },
                    child: Text('Back'))
              ],
            ),
          ),
        ),
      );
    });
  }
}
