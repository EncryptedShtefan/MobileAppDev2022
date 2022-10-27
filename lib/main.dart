import 'package:flutter/material.dart';
import 'authwindow.dart';

void main() {
  runApp(const Login());
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 247, 229, 243),
      ),
      home: const Authwindow(),
    );
  }
}
