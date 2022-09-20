import 'package:flutter/material.dart';
import 'package:lb003qualif/login.dart';

void main(List<String> args) {
  runApp(const CodeBots());
}

class CodeBots extends StatelessWidget {
  const CodeBots({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CodeBots",
      home: LoginPage(),
    );
  }
}
