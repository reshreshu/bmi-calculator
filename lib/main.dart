import 'package:flutter/material.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BMICalculatorHome(),
    );
  }
}

class BMICalculatorHome extends StatefulWidget {
  @override
  _BMICalculatorHomeState createState() => _BMICalculatorHomeState();
}

class _BMICalculatorHomeState extends State<BMICalculatorHome> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _bmi = 0.0;
  String _bmiCategory = '';

  void _calculateBMI() {
    final double height = double.tryParse(_heightController.text) ?? 0.0;
    final double weight = double.tryParse(_weightController.text) ?? 0.0;

    if (height > 0 && weight > 0) {
      setState(() {
        _bmi = weight / (height * height);
        if (_bmi < 18.5) {
          _bmiCategory = 'Underweight';
        } else if (_bmi >= 18.5 && _bmi < 24.9) {
          _bmiCategory = 'Normal weight';
        } else if (_bmi >= 25 && _bmi < 29.9) {
          _bmiCategory = 'Overweight';
        } else {
          _bmiCategory = 'Obesity';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Height (m)',
              ),
            ),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Weight (kg)',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: Text('Calculate BMI'),
            ),
            SizedBox(height: 20),
            Text(
              _bmi == 0 ? '' : 'Your BMI: ${_bmi.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              _bmiCategory,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
