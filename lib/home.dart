import 'package:flutter/material.dart';
import 'package:playerid/categories.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromRGBO(9, 20, 66, 1)),
      body: Center(
          child: Column(children: [
        const SizedBox(
          height: 10,
        ),
        Image.asset(
          'images/emblem.png',
          width: MediaQuery.of(context).size.width * 0.5,
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Categoriesc()),
            );
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(53, 98, 166, 1)),
          child: const Text(
            'Play',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ])),
    );
  }
}
