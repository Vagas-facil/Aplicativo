import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.black),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 150,
              height: 150,
            ),
            Column(
              children: [
                const Text(
                  'Faça já o seu login',
                  style: TextStyle(fontSize: 20),
                ),
                Container(
                  width: 250,
                  height: 250,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Form(
                    child: TextFormField(),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
