import "package:flutter/material.dart";
import 'package:suitmedia_test_app/pages/second_page.dart';
import 'package:suitmedia_test_app/widgets/my_button.dart';
import 'package:suitmedia_test_app/widgets/my_textfield.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);
  static const routePath = '/firstPage';

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController palindromeController = TextEditingController();
  bool isPalindrome(String text) {
    var theText = '';
    var pal = '';

    for (var i = 0; i < text.length; i++) {
      if (text[i] != " ") {
        theText = text[i] + theText;
      }
    }

    for (var i = text.length - 1; i >= 0; i--) {
      if (text[i] != " ") {
        pal = pal + text[i];
      }
    }

    if (pal == theText) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: KeyboardDismisser(
          gestures: [
            GestureType.onTap,
          ],
          child: GestureDetector(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/background 1.png"),
                    fit: BoxFit.cover),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child:
                              Image(image: AssetImage("assets/ic_photo.png")),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              MyTextField(
                                text: 'Name',
                                textController: nameController,
                              ),
                              SizedBox(
                                height: 22,
                              ),
                              MyTextField(
                                text: 'Palindrome',
                                textController: palindromeController,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              MyButton(
                                  text: 'CHECK',
                                  onTap: () {
                                    var palindromeMsg = '';
                                    if (palindromeController.text.isNotEmpty) {
                                      if (isPalindrome(palindromeController.text
                                          .toLowerCase())) {
                                        palindromeMsg = 'isPalindrome';
                                      } else {
                                        palindromeMsg = 'not palindrome';
                                      }
                                    } else {
                                      palindromeMsg = 'please input the text!';
                                    }

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(palindromeMsg),
                                      ),
                                    );
                                  }),
                              SizedBox(
                                height: 15,
                              ),
                              MyButton(
                                  text: 'NEXT',
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                      SecondPage.routePath,
                                      arguments: nameController.text.toString(),
                                    );
                                    palindromeController.clear();
                                    nameController.clear();
                                  }),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
