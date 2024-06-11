import 'package:flutter/material.dart';
import 'calculator.dart';

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

class ExpandedButton extends StatelessWidget {
  const ExpandedButton({
    super.key,
    required this.onPressed,
    required this.color,
    required this.child,
  });

  final Color color;
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
        child: child,
      ),
    );
  }
}

class ExpandedRow extends StatelessWidget {
  const ExpandedRow({
    super.key,
    required this.children,
    required this.crossAxisAlignment,
  });

  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        crossAxisAlignment: crossAxisAlignment,
        children: children,
      ),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  const CalculatorHomePage({
    super.key,
    required this.title,
  });
  final String title;

  @override
  State<CalculatorHomePage> createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String _str = '0';
  var _calculation = Calculation();

  void add(String a) {
    setState(() {
      _calculation.add(a);
      _str = _calculation.getString();
    });
  }

  void deleteAll() {
    setState(() {
      _calculation.deleteAll();
      _str = _calculation.getString();
    });
  }

  void deleteOne() {
    setState(() {
      _calculation.deleteOne();
      _str = _calculation.getString();
    });
  }

  void getResult() {
    setState(() {
      try {
        _str = _calculation.getResult().toString();
      } on DivideByZeroException {
        _str = "You musn't divide by zero!";
      } finally {
        _calculation = Calculation();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Card(
                color: Colors.lightGreen[50],
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    _str,
                    textScaler: const TextScaler.linear(2.0),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: TextButton(
                      onPressed: () {
                        deleteAll();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black54,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                      ),
                      child: const Text(
                        'C',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {
                        deleteOne();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                      ),
                      child: const Text(
                        '<-',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            ExpandedRow(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                ExpandedButton(
                                  onPressed: () {
                                    add('7');
                                  },
                                  color: Colors.blueAccent,
                                  child: const Text(
                                    '7',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                ExpandedButton(
                                  onPressed: () {
                                    add('8');
                                  },
                                  color: Colors.blueAccent,
                                  child: const Text(
                                    '8',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                ExpandedButton(
                                  onPressed: () {
                                    add('9');
                                  },
                                  color: Colors.blueAccent,
                                  child: const Text(
                                    '9',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            ExpandedRow(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                ExpandedButton(
                                  onPressed: () {
                                    add('4');
                                  },
                                  color: Colors.blueAccent,
                                  child: const Text(
                                    '4',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                ExpandedButton(
                                  onPressed: () {
                                    add('5');
                                  },
                                  color: Colors.blueAccent,
                                  child: const Text(
                                    '5',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                ExpandedButton(
                                  onPressed: () {
                                    add('6');
                                  },
                                  color: Colors.blueAccent,
                                  child: const Text(
                                    '6',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            ExpandedRow(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                ExpandedButton(
                                  onPressed: () {
                                    add('1');
                                  },
                                  color: Colors.blueAccent,
                                  child: const Text(
                                    '1',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                ExpandedButton(
                                  onPressed: () {
                                    add('2');
                                  },
                                  color: Colors.blueAccent,
                                  child: const Text(
                                    '2',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                ExpandedButton(
                                  onPressed: () {
                                    add('3');
                                  },
                                  color: Colors.blueAccent,
                                  child: const Text(
                                    '3',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            ExpandedRow(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                ExpandedButton(
                                  onPressed: () {
                                    add('0');
                                  },
                                  color: Colors.blueAccent,
                                  child: const Text(
                                    '0',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                ExpandedButton(
                                  onPressed: () {
                                    add('.');
                                  },
                                  color: Colors.blueAccent,
                                  child: const Text(
                                    '.',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                ExpandedButton(
                                  onPressed: () {
                                    getResult();
                                  },
                                  color: Colors.blue[50]!,
                                  child: const Text(
                                    '=',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          ExpandedButton(
                            onPressed: () {
                              add('÷');
                            },
                            color: Colors.blue[50]!,
                            child: Image.asset(
                              'icons/divide.png',
                              width: 10.0,
                              height: 10.0,
                            ),
                          ),
                          ExpandedButton(
                            onPressed: () {
                              add('x');
                            },
                            color: Colors.blue[50]!,
                            child: const Text(
                              'x',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          ExpandedButton(
                            onPressed: () {
                              add('-');
                            },
                            color: Colors.blue[50]!,
                            child: const Text(
                              '-',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          ExpandedButton(
                            onPressed: () {
                              add('+');
                            },
                            color: Colors.blue[50]!,
                            child: const Text(
                              '+',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
