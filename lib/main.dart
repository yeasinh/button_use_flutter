import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Button State',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Button State'),
            centerTitle: true,
            backgroundColor: Colors.grey[800],
          ),
          body: const MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _btn = "";
  bool pressedBlue = false;
  bool pressedRed = false;
  bool pressedGreen = false;

  void _setButtonName(String btn) {
    setState(() {
      _btn = btn;
      if (btn == "BLUE") {
        pressedBlue = true;
        pressedRed = false;
        pressedGreen = false;
      } else if (btn == "RED") {
        pressedRed = true;
        pressedBlue = false;
        pressedGreen = false;
      } else if (btn == "GREEN") {
        pressedGreen = true;
        pressedBlue = false;
        pressedRed = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10.0),
                color: Colors.blueGrey,
                child: Center(
                  child: Column(
                    children: [
                      const Text(
                        'You have pressed:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        _btn,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    onPressed: () => _setButtonName("BLUE"),
                    child: pressedBlue
                        ? const Text("PRESSED")
                        : const Text("BLUE button"),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    onPressed: () => _setButtonName("RED"),
                    child: pressedRed
                        ? const Text("PRESSED")
                        : const Text("RED button"),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    onPressed: () => _setButtonName("GREEN"),
                    child: pressedGreen
                        ? const Text("PRESSED")
                        : const Text("GREEN button"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
