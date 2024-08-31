import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      //to remove unnecessary container
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                customOutlinedButton("9"),
                customOutlinedButton("8"),
                customOutlinedButton("7"),
                customOutlinedButton("+"),
              ],
            ),
            Row(
              children: [
                customOutlinedButton("6"),
                customOutlinedButton("5"),
                customOutlinedButton("4"),
                customOutlinedButton("-"),
              ],
            ),
            Row(
              children: [
                customOutlinedButton("3"),
                customOutlinedButton("2"),
                customOutlinedButton("1"),
                customOutlinedButton("x"),
              ],
            ),
            Row(
              children: [
                customOutlinedButton("C"),
                customOutlinedButton("0"),
                customOutlinedButton("="),
                customOutlinedButton("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Expanded customOutlinedButton(String val) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(25.0),
        ),
        onPressed: () => btnClicked(val),
        child: Text(
          val,
          style: const TextStyle(
            fontSize: 35.0,
          ),
        ),
      ),
    );
  }

  late int first, second;
  late String res, text = "", opp;
  void btnClicked(String btnText) {
    if (btnText == "C") {
      res = "";
      text = "";
      first = 0;
      second = 0;
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "x" ||
        btnText == "/") {
      first = int.parse(text);
      res = "";
      opp = btnText;
    } else if (btnText == "=") {
      second = int.parse(text);
      if (opp == "+") {
        res = (first + second).toString();
      }
      if (opp == "-") {
        res = (first - second).toString();
      }
      if (opp == "x") {
        res = (first * second).toString();
      }
      if (opp == "/") {
        res = (first / second).toString();
        //to remove decimal point
      }
    } else {
      res = int.parse(text + btnText).toString();
    }
    setState(() {
      text = res;
    });
  }
}
