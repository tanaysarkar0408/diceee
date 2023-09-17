import 'package:flutter/material.dart';
import 'dart:math';
import 'package:shake/shake.dart';

void main() {
  return runApp(
       MaterialApp(
         home: Scaffold(
           backgroundColor: Colors.blue[700],
           appBar: AppBar(
             title: const Text('Dicee'),
             centerTitle: true,
             backgroundColor: Colors.blue[900],
           ),
           body: DicePage(),
         ),
       )
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber =1;

  @override
  Widget build(BuildContext context) {
    ShakeDetector.autoStart(onPhoneShake: (){
      setState(() {
        leftDiceNumber= Random().nextInt(6)+1;
        rightDiceNumber = Random().nextInt(6)+1;
      });
  });
    return Center(
      child: Row(
        children: [
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('images/dice$leftDiceNumber.png'),
              )),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('images/dice$rightDiceNumber.png'),
              )),
        ],
      ),
    );
  }
}

