import 'package:flutter/material.dart';

class Smth extends StatefulWidget {
  const Smth({Key? key}) : super(key: key);

  @override
  _SmthState createState() => _SmthState();
}

class _SmthState extends State<Smth> {
  @override
  Widget build(BuildContext context) {
    final currWidth = MediaQuery.of(context).size.width;
    final currHeight = MediaQuery.of(context).size.height;
    var height = currHeight.toInt();
    var width = currWidth.toInt();
    if ((height > 255) | (width > 255)) {
      if (height > 255) height = height ~/ 2;
      if (width > 255) width = width ~/ 2;
    }

    return Scaffold(
        backgroundColor: Color.fromARGB(width ~/ 2, height ~/ 2, width, height),
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    Text(currWidth.toString()),
                    Text(width.toString()),
                    Text(height.toString()),
                  ],
                ))));
  }
}
