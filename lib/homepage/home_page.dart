import 'package:flutter/material.dart';
import 'package:flutter_one/homepage/body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      backgroundColor: const Color(0xff000000), //0xff7F8CA6
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: const Color(0xff000000), //0xff232735
        title: Image.asset(
          'assets/logo.png',
          width: 130,
          height: 130,
        ),
      ),
      body: const BodyWidget(),
    ));
  }
}
