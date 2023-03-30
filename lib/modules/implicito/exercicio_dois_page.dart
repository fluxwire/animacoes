import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ExercicioDoisPage extends StatefulWidget {
  const ExercicioDoisPage({Key? key}) : super(key: key);

  @override
  State<ExercicioDoisPage> createState() => _ExercicioDoisPageState();
}

class _ExercicioDoisPageState extends State<ExercicioDoisPage> {
  final List<String> listExemplo = List<String>.generate(
      100, ((index) => 'My expansion title $index'),
      growable: true);
  bool expandir = false;

  _renderList(BuildContext context) {
    return ListView.builder(
      itemCount: listExemplo.length,
      itemBuilder: (BuildContext context, int index) {
        if (listExemplo.isNotEmpty) {
          /*return ListTile(
            title: Text(listExemplo[index]),
          );*/
          return CustonExpansionTitle(
            item: listExemplo[index],
          );
        } else {
          return Container();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyScrollView'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close),
        ),
      ),
      body: _renderList(context),
    );
  }
}

class CustonExpansionTitle extends StatefulWidget {
  final String item;

  const CustonExpansionTitle({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<CustonExpansionTitle> createState() => _CustonExpansionTitleState();
}

class _CustonExpansionTitleState extends State<CustonExpansionTitle> {
  bool expandir = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                expandir = !expandir;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(widget.item),
                  ),
                  AnimatedRotation(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeIn,
                    turns: expandir == false ? 0 : 0.5,
                    child: const Icon(Icons.keyboard_arrow_down),
                  ),
                ],
              ),
            ),
          ),
          AnimatedAlign(
            heightFactor: expandir == false ? 0 : 1,
            duration: const Duration(milliseconds: 400),
            alignment: Alignment.topCenter,
            curve: Curves.easeIn,
            child: Container(
              // color: Colors.white,
              child: Column(
                children: const [
                  Image(
                      image: AssetImage('assets/flutter_image.png'),
                      fit: BoxFit.fill,
                      width: 50),
                  Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*Widget build(BuildContext context) {
    return AnimatedAlign(
      heightFactor: expandir == false ? 1 : 1,
      duration: const Duration(seconds: 1),
      alignment: Alignment.topCenter,
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        height: expandir == false ? 50 : 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  expandir = !expandir;
                });
              },
              child: SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(widget.item),
                    ),
                    AnimatedRotation(
                      duration: const Duration(seconds: 1),
                      turns: expandir == false ? 0 : 0.5,
                      child: const Icon(Icons.keyboard_arrow_down),
                    ),
                  ],
                ),
              ),
            ),
            const Image(
                image: AssetImage('assets/flutter_image.png'),
                fit: BoxFit.fill,
                width: 50),
          ],
        ),
      ),
    );
  }
  */