import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                  margin: const EdgeInsets.only(top: 10),
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.white
                  ),
                ),
              ],
            ),
            Column()
          ],
        ),
      ),
    );
  }
}
