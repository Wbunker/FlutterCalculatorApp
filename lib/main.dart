import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calulator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black26,
      ),
      home: const CalculatorHomePage(title: 'Flutter Calculator'),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  const CalculatorHomePage({
    super.key,
    this.title,
  });
  final String title;

  @override
  State<CalculatorHomePage> createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String _str = '0';

  void add(String a) {
    setState(() {
      _str += a;
    });
  }

  void deleteAll() {
    setState(() {
      _str = '0';
    });
  }

  void deleteOne() {
    setState(() {
      _str = _str.substring(0, _str.length - 1);
    });
  }

  void getResult() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Card(
            color: Colors.lightGreen[50],
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                _str,
                textScaler: const TextScaler.linear(2.0),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  deleteAll();
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                child: const Text(
                  'C',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {
                  deleteOne();
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                child: const Text(
                  '<-',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          const Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[],
                      ),
                    ]),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[],
                )
              ])
        ],
      ),
    );
  }
}
