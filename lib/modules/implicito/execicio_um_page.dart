import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ExercicioUmPage extends StatefulWidget {
  const ExercicioUmPage({Key? key}) : super(key: key);

  @override
  State<ExercicioUmPage> createState() => _ExercicioUmPageState();
}

class _ExercicioUmPageState extends State<ExercicioUmPage> {
  bool circle = true;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Desafio do Botão Flutuante'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close),
        ),
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            top: circle ? mediaQuery.size.height - 140 : 40,
            curve: Curves.easeIn,
            left: circle
                ? mediaQuery.size.width - 80
                : (mediaQuery.size.width / 2) - 50,
            duration: const Duration(milliseconds: 500),
            child: GestureDetector(
              child: AnimatedContainer(
                height: 50,
                width: circle ? 50 : 100,
                curve: Curves.easeIn,
                duration: const Duration(milliseconds: 500),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius:
                      circle ? BorderRadius.circular(50) : BorderRadius.zero,
                ),
              ),
              onTap: () {
                setState(
                  () {
                    circle = !circle;
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
