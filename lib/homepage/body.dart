import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

class BodyWidget extends StatefulWidget {
  const BodyWidget({super.key});

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  @override
  Widget build(BuildContext context) {
    return (Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/home_background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BorderedText(
            strokeWidth: 4.0,
            strokeColor: Colors.black,
            child: const Text(
              textAlign: TextAlign.center,
              'Faça seu negócio decolar\ncom nossos serviços.',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      blurRadius: 8,
                    )
                  ]),
            ),
          ),
          BorderedText(
            strokeWidth: 4.0,
            strokeColor: Colors.black,
            child: const Text(
              'Abrace a tecnologia!',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      blurRadius: 8,
                    )
                  ]),
            ),
          ),
          Container(
            width: 300,
            height: 130,
            decoration: BoxDecoration(
                color: const Color(0xC3FFFFFF),
                border: Border.all(width: 1.5),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BorderedText(
                  strokeWidth: 4.0,
                  strokeColor: Colors.black,
                  child: const Text(
                    textAlign: TextAlign.center,
                    'Encontre o lugar adequado para\no seu carro:',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_outlined),
                  label: const Text('Ache sua vaga'),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
