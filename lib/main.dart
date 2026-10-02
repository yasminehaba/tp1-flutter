import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final TextEditingController amountController =
      TextEditingController();

  String conversion = 'DinarToEuro';

  String result = '';

  final double taux = 3.40;

  void convert() {

    double amount = double.parse(amountController.text);

    double converted;

    if (conversion == 'DinarToEuro') {

      converted = amount / taux;

      setState(() {
        result =
            'le resultat est ${converted.toStringAsFixed(3)} euros';
      });

    } else {

      converted = amount * taux;

      setState(() {
        result =
            'le resultat est ${converted.toStringAsFixed(3)} dinars';
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
    

      home: Scaffold(

      
        appBar: AppBar(
          title: const Text('Tp1 APP'),
          backgroundColor: Colors.purple,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: amountController,
            decoration: const InputDecoration(
              labelText: 'Montant'),
            ),
            RadioListTile<String>(
              title: const Text('Dinar to Euro'),
              value: 'DinarToEuro',
              groupValue: conversion,
              onChanged: (value) {
                setState(() {
                  conversion = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Euro to Dinar'),
              value: 'EuroToDinar',
              groupValue: conversion,
              onChanged: (value) {
                setState(() {
                  conversion = value!;
                });
              },
            ),
            Text(result, style: const TextStyle(
    color: Colors.red),),
            ElevatedButton(
              onPressed: convert,
              child: const Text('Convertir'),
            ),
            ],
      ),
    ),
  );
}
}