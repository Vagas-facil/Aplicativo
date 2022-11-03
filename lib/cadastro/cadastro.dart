import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_one/login/login_page.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _form = GlobalKey<FormState>();

  final _nome = TextEditingController();
  final _email = TextEditingController();
  final _senha = TextEditingController();
  var _senhaVisivel = false;

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
                      "Faça seu cadastro",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                Form(
                  key: _form,
                  child: Container(
                    width: 250,
                    height: 280,
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
                            controller: _nome,
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 0, 0, 0),
                                hintText: "Nome",
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
                            onPressed: () {},
                            child: const Text(
                              "Cadastre-se",
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
                              builder: (context) => const LoginPage()));
                        },
                        child: const Text(
                          "Faça login",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )))
              ],
            ),
          ),
        )));
  }
}
