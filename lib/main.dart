// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  const CalculatorHomePage({super.key});

  @override
  State<CalculatorHomePage> createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  TextEditingController number1 = TextEditingController();

  TextEditingController number2 = TextEditingController();

  double result = 0;
  double mathsOperation(String operation) {
    double num1 = double.parse(number1.text);
    double num2 = double.parse(number2.text);

    if (operation == "add") {
      return num1 + num2;
    } else if (operation == "sub") {
      return num1 - num2;
    } else if (operation == "div") {
      return num1 / num2;
    } else if (operation == "mul") {
      return num1 * num2;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Center(child: Text("Simple caculator")),
        ),
        body: Column(children: [
          Text(
            "Result: $result",
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: number1,
              decoration: InputDecoration(
                  labelText: "Enter First Number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: number2,
              decoration: InputDecoration(
                  labelText: "Enter Second Number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                  onPressed: () {
                    result = mathsOperation("add");
                    setState(() {});
                  },
                  child: const Text("Sum")),
              const SizedBox(width: 10),
              ElevatedButton(
                  onPressed: () {
                    result = mathsOperation("div");
                    setState(() {});
                  },
                  child: const Text("Divide"))
            ]),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      result = mathsOperation("mul");
                      setState(() {});
                    },
                    child: const Text("Mul")),
                const SizedBox(width: 10),
                ElevatedButton(
                    onPressed: () {
                      result = mathsOperation("sub");
                      setState(() {});
                      log(result.toString());
                    },
                    child: const Text("Sub"))
              ],
            )
          ])
        ]));
  }
}
