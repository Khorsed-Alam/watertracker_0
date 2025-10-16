import 'package:flutter/material.dart';
import 'Widgets/addWaterButton.dart';

class Watertracker extends StatefulWidget {
  const Watertracker({super.key});

  @override
  State<Watertracker> createState() => _WatertrackerState();
}

class _WatertrackerState extends State<Watertracker> {
  int currnetInTake = 0;
  final int goal = 2000;

  void waterAdd(int amount) {
    setState(() {
      currnetInTake = (currnetInTake + amount).clamp(0, goal);
    });
  }

  void resetTank() {
    setState(() {
      currnetInTake = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    double progress = (currnetInTake / goal).clamp(0, 1);

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text(
          'Water Tracker',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(80),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.amberAccent.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 2,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      "Today's Intake",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${currnetInTake} ml',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.teal.shade100,
                      color: Colors.blueAccent,
                      strokeWidth: 10,
                      value: progress,
                    ),
                  ),
                  Text(
                    '${(progress * 100).toInt()}%',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                children: [
                  addWaterButton(amount: 100, onClick: () => waterAdd(100)),
                  addWaterButton(amount: 500, onClick: () => waterAdd(500)),
                  addWaterButton(amount: 1000, onClick: () => waterAdd(1000)),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: resetTank,
                    child: const Text('Reset'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
