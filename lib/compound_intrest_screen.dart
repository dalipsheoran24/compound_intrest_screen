import 'dart:math';

import 'package:flutter/material.dart';

class CompoundInterestScreen extends StatefulWidget {
  const CompoundInterestScreen({Key? key}) : super(key: key);

  @override
  State<CompoundInterestScreen> createState() => _CompoundInterestScreenState();
}

class _CompoundInterestScreenState extends State<CompoundInterestScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController interestController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  var totalAmount;
  var interest = 0;
  var time = 0;
  var amount = 0;
  var ci;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('CI Calculator'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  const Text('Amount'),
                  const SizedBox(
                    width: 4,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16),
                  ),
                  Expanded(
                    child: TextField(
                      controller: amountController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        hintText: 'Enter Amount',
                      ),
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  const Text('Interest(%)'),
                  const SizedBox(
                    width: 4,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16),
                  ),
                  Expanded(
                    child: TextField(
                      controller: interestController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        hintText: 'Enter Interest',
                      ),
                    ),
                  ),
                ]),
              ),
              Row(children: [
                const Text('Time(years)'),
                const SizedBox(
                  width: 4,
                ),
                const Padding(
                  padding: EdgeInsets.all(16),
                ),
                Expanded(
                  child: TextField(
                    controller: timeController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      hintText: 'Enter Time',
                    ),
                  ),
                ),
              ]),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  compInterest();
                },
                child: const Text('Calculate'),
              ),
              const SizedBox(
                height: 16,
              ),
              Text('TotalAmount=$totalAmount'),
              Text(
                'CI=$ci',
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void compInterest() {
    int amount = int.parse(amountController.text);
    int r = int.parse(interestController.text);
    int t = int.parse(timeController.text);
    totalAmount = amount * pow((1 + r / 100), t);
    ci = totalAmount - amount;
    setState(() {});
  }
}
