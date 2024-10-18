import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EMICalculator extends StatefulWidget {
  const EMICalculator({super.key});

  @override
  State<EMICalculator> createState() => _EMICalculatorState();
}

class _EMICalculatorState extends State<EMICalculator> {
  TextEditingController priceController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  String emiResult = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('EMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'Enter Principal Amount'),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: rateController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration:
                  InputDecoration(hintText: 'Enter Annual Interest Rate(%)'),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
              ],
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: timeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'Enter Time(Months)'),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {
                  double princpal = double.parse(priceController.text);
                  double annualInterestRate = double.parse(rateController.text);
                  int timeIn = int.parse(timeController.text);

                  double monthlyInteresRate = annualInterestRate / 12 / 100;

                  double emi = (princpal *
                          monthlyInteresRate *
                          pow(1 + monthlyInteresRate, timeIn)) /
                      (pow(1 + monthlyInteresRate, timeIn) - 1);
                  setState(() {
                    emiResult = emi.toString();
                  });
                },
                child: Text('Calculator EMI')),
            SizedBox(
              height: 16,
            ),
            Text(emiResult.isEmpty
                ? 'Enter Value to Calculate EMI'
                : 'Your Emi: $emiResult',style: TextStyle(fontSize: 22),)
          ],
        ),
      ),
    ));
  }
}
