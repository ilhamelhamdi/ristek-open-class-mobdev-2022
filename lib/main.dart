import 'package:flutter/material.dart';
import 'package:ristek_op_mobdev/login.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Portfolio',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: LoginPage());
  }
}
