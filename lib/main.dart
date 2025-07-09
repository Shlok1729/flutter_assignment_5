import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const BMICalculatorApp());

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const BMIScreen(),
    );
  }
}

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  double _height = 160; // in cm
  double _weight = 60; // in kg

  double get _bmi {
    final heightInMeters = _height / 100;
    return _weight / pow(heightInMeters, 2);
  }

  String get _bmiCategory {
    final bmi = _bmi;
    if (bmi < 18.5) return "Underweight 😟";
    if (bmi < 24.9) return "Normal 😊";
    if (bmi < 29.9) return "Overweight 😅";
    return "Obese 😨";
  }

  Color get _bmiColor {
    final bmi = _bmi;
    if (bmi < 18.5) return Colors.blue.shade200;
    if (bmi < 24.9) return Colors.green.shade300;
    if (bmi < 29.9) return Colors.orange.shade300;
    return Colors.red.shade300;
  }

  void _resetValues() {
    setState(() {
      _height = 160;
      _weight = 60;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bmi = _bmi.toStringAsFixed(1);

    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator 💪"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [_bmiColor.withOpacity(0.4), _bmiColor.withOpacity(0.8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              "Height: ${_height.toInt()} cm",
              style: const TextStyle(fontSize: 18),
            ),
            Slider(
              min: 100,
              max: 220,
              value: _height,
              onChanged: (value) => setState(() => _height = value),
            ),
            const SizedBox(height: 8),
            Text(
              "Weight: ${_weight.toInt()} kg",
              style: const TextStyle(fontSize: 18),
            ),
            Slider(
              min: 30,
              max: 150,
              value: _weight,
              onChanged: (value) => setState(() => _weight = value),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: _bmiColor.withOpacity(0.6),
                      blurRadius: 15,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      "Your BMI",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple.shade900,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      bmi,
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(_bmiCategory, style: const TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(80.0),
              child: ElevatedButton.icon(
                onPressed: _resetValues,
                icon: const Icon(Icons.refresh, color: Colors.red),
                label: const Text("Reset", style: TextStyle(color: Colors.red)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
