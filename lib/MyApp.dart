import 'package:flutter/material.dart';
import 'package:watertracker_0/WaterTracker.dart';

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Water Tracker',
      home: Watertracker(),

    );
  }
}

