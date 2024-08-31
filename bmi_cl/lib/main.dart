import 'package:flutter/material.dart';

// learn adobe ext
/*
* Green: #12a644
* Grey: #403f3d
* */
void main() => runApp(
      MaterialApp(
        theme: ThemeData(
          // colorScheme: ColorScheme.fromSwatch().copyWith(
          //   primary: const Color(0xff12a644),
          // ),
          primaryColor: const Color(0xff12a644),
        ),
        home: const MyApp(),
        debugShowCheckedModeBanner: false,
      ),
    );

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _height = 170.0;
  double _weight = 75.0;
  int _bmi = 0;
  String _condition = 'Select Data';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: size.height * 0.43,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 30.0,
                horizontal: 10.0,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                //do not give padding in column
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "BMI",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 60.0,
                    ),
                  ),
                  const Text(
                    "Calculator",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      child: Text(
                        "$_bmi",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 45.0,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Condition : ",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "$_condition",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 10.0,
              ),
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  SizedBox(height: size.height * 0.03),
                  Text(
                    "Choose Data",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  RichText(
                    text: TextSpan(
                      text: "Height : ",
                      style: const TextStyle(
                        color: Color(0xff403f3d),
                        fontSize: 25.0,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "$_height cm",
                          style: const TextStyle(
                            color: Color(0xff403f3d),
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Slider(
                    value: _height,
                    min: 0,
                    max: 250,
                    onChanged: (height) {
                      setState(() {
                        _height = height;
                      });
                    },
                    divisions: 250,
                    label: "$_height",
                    activeColor: const Color(0xFF403f3d),
                    inactiveColor: Colors.grey,
                  ),
                  SizedBox(height: size.height * 0.03),
                  RichText(
                    text: TextSpan(
                      text: "Weight : ",
                      style: const TextStyle(
                        color: Color(0xff403f3d),
                        fontSize: 25.0,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "$_weight kg",
                          style: const TextStyle(
                            color: Color(0xff403f3d),
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Slider(
                    value: _weight,
                    min: 0,
                    max: 300,
                    onChanged: (weight) {
                      setState(() {
                        _weight = weight;
                      });
                    },
                    divisions: 300,
                    label: "$_weight",
                    activeColor: const Color(0xFF403f3d),
                    inactiveColor: Colors.grey,
                  ),
                  SizedBox(height: size.height * 0.03),
                  SizedBox(
                    width: size.width * 0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 40,
                          ),
                        ),
                        onPressed: () {
                          setState(
                            () {
                              //  18.5 - 25 Healthy, 25 - 30 Overweight, > 30 Obesity
                              //   Formula
                              /*
                            * BMI = Weight (Kg) / (height in meters)**2
                            * */
                              _bmi = (_weight /
                                      ((_height / 100) * (_height / 100)))
                                  .round()
                                  .toInt();
                              if (_bmi >= 18.5 && _bmi <= 25) {
                                _condition = " Normal";
                              } else if (_bmi > 25 && _bmi <= 30) {
                                _condition = " Overweight";
                              } else if (_bmi > 30) {
                                _condition = " Obesity";
                              } else {
                                _condition = " Underweight";
                              }
                            },
                          );
                        },
                        child: const Text(
                          "Calculate",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
