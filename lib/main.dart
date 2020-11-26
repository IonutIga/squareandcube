import 'package:flutter/material.dart';
import 'package:powers/powers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int number;
  String error;
  double result;
  int property = 0;

  void _checkNumber() {
    setState(() {
      if (number != null) {
        if (number.isSquare)
          property += 1;
        if (number.isCube)
          property += 2;

        switch (property) {
          case 0:
            showDialog<AlertDialog>(
              context: context,
              builder: (_) => AlertDialog(
                title: Text(number.toStringAsFixed(0)),
                content:
                    Text(number.toString() + ' is neither SQUARE nor CUBE!'),
              ),
              barrierDismissible: true,
            );
            break;
          case 1:
            showDialog<AlertDialog>(
              context: context,
              builder: (_) => AlertDialog(
                title: Text(number.toStringAsFixed(0)),
                content: Text(number.toString() + ' is SQUARE!'),
              ),
              barrierDismissible: true,
            );
            break;
          case 2:
            showDialog<AlertDialog>(
              context: context,
              builder: (_) => AlertDialog(
                title: Text(number.toStringAsFixed(0)),
                content: Text(number.toString() + ' is CUBE!'),
              ),
              barrierDismissible: true,
            );
            break;
          case 3:
            showDialog<AlertDialog>(
              context: context,
              builder: (_) => AlertDialog(
                title: Text(number.toStringAsFixed(0)),
                content: Text(number.toString() + ' is SQUARE and CUBE!'),
              ),
              barrierDismissible: true,
            );
            break;
        }
      }
      property = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Shapes'),
        centerTitle: true,
      ),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Insert a number to verify if it\'s square or cube',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
            child: TextField(
              keyboardType: const TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                hintText: 'Please insert a number',
                errorText: error,
              ),
              onChanged: (String value) {
                setState(() {
                  if (value.isEmpty)
                    number = null;
                  if (int.tryParse(value) != null) {
                    number = int.tryParse(value);
                    error = null;
                  } else if (value.isNotEmpty) {
                    error = 'Only integer values allowed!';
                    number = null;
                  }
                });
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _checkNumber,
        tooltip: 'Check',
        child: const Icon(Icons.check),
      ),
    );
  }
}
