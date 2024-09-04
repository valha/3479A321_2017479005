// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home> {
  int value = 0;
  final String avionPath = 'assets/icons/avion.svg';
  final logger = Logger();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[600],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text(
            "Laboratorio 2",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 80),
          child: FloatingActionButton(
            onPressed: () {
              logger.d("Logger is Working!");
              resetValue();
            },
            backgroundColor: Colors.black,
            child: Icon(
              Icons.account_balance,
              color: Colors.white,
            ),
          ),
        ),
        persistentFooterButtons: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    minusOne();
                  },
                  child: Icon(Icons.remove)),
              ElevatedButton(
                  onPressed: () {
                    plusOne();
                  },
                  child: Icon(Icons.add)),
            ],
          ),
        ],
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(avionPath, width: 150, height: 150),
            Text(
              "El contador actual es el siguiente",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              value.toString(),
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 5, 54, 22)),
            ),
          ],
        )));
  }

  void plusOne() {
    setState(() {
      value++;
    });
  }

  void minusOne() {
    setState(() {
      value--;
    });
  }

  void resetValue() {
    setState(() {
      value = 0;
    });
  }
}
