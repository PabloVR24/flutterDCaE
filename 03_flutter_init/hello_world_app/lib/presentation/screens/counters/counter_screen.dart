import 'package:flutter/material.dart';

class ConuterScreen extends StatefulWidget {
  const ConuterScreen({super.key});

  @override
  State<ConuterScreen> createState() => _ConuterScreenState();
}

class _ConuterScreenState extends State<ConuterScreen> {
  int clickCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            'Counter Screen',
          )),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$clickCounter',
                style:
                    const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
              ),
              Text(
                clickCounter == 1 ? 'Click' : 'Clicks',
                style: const TextStyle(fontSize: 25),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              clickCounter++;
            });
          },
          child: const Icon(Icons.plus_one),
        ));
  }
}
