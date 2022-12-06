import 'package:flutter/material.dart';
import 'package:flutter_one/login/login_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Vagas Fácil',
    theme: ThemeData.dark(),
    home: const LoginPage(),
  ));
}