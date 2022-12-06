import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_one/cadastro/cadastro.dart';
import 'package:flutter_one/homepage/home_page.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _form = GlobalKey<FormState>();

  final _email = TextEditingController();
  final _senha = TextEditingController();
  var _senhaVisivel = false;

  Future<dynamic> ePostRequest(String email, String senha) async {
    final response = await http.get(
      Uri.parse("http://192.168.15.19/sitehtml-0.1/codigo/login.php"),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
    );

    print(response.statusCode);
    print(response);
    //print(response.body);

    List<dynamic> dados = jsonDecode(response.body);

    for (var usuario in dados) {
      if (email == usuario['Email'] && senha == usuario['Senha']) {
        print("Autenticado");

        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const HomePage()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (!isKeyboard)
                  Image.asset(
                    'assets/logo.png',
                    width: 150,
                    height: 150,
                  ),
                const Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Text(
                      "Faça seu login",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                Form(
                  key: _form,
                  child: Container(
                    width: 250,
                    height: 230,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 200,
                          height: 40,
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) return "Digite novamente";
                            },
                            controller: _email,
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 0, 0, 0),
                                hintText: "E-mail",
                                hintStyle: TextStyle(color: Colors.black),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.black))),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        SizedBox(
                          width: 200,
                          height: 40,
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) return "Digite novamente";
                            },
                            controller: _senha,
                            obscureText: !_senhaVisivel,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                hintText: "Senha",
                                hintStyle: const TextStyle(color: Colors.black),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.black)),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _senhaVisivel = !_senhaVisivel;
                                      });
                                    },
                                    icon: Icon(
                                      _senhaVisivel
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Theme.of(context).primaryColorDark,
                                    ))),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(150, 40),
                                backgroundColor: Colors.black),
                            onPressed: () {
                              if (_form.currentState!.validate()) {
                                setState(() {
                                  ePostRequest(_email.text, _senha.text);
                                });
                              }
                            },
                            child: const Text(
                              "Entrar",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(150, 40),
                            backgroundColor: Colors.white),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const CadastroPage()));
                        },
                        child: const Text(
                          "Cadastre-se",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )))
              ],
            ),
          ),
        )));
  }
}
