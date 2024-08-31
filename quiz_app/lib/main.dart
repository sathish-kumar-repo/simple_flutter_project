import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var score = 0;
  var n = 0;
  List que_list = [
    Questions("1.Ms Word is a hardware", false),
    Questions("2.CPU controls only input data of computer.", false),
    Questions("3.CPU stands for Central Processing Unit.", true),
    Questions(
        "4.Freeware is software that is available for use at no monetary cos.",
        false),
  ];
  void checkanswer(bool choice, BuildContext ctx) {
    if (choice == que_list[n].ans) {
      // debugPrint("Correct");
      score++;
      const snackbar = SnackBar(
        content: Text("Correct Answer"),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.green,
      );
      ScaffoldMessenger.of(ctx).showSnackBar(snackbar);
    } else {
      const snackbar = SnackBar(
        content: Text("Wrong Answer"),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(ctx).showSnackBar(snackbar);
    }
    setState(() {
      if (n < que_list.length - 1) {
        n++;
      } else {
        final snackbar = SnackBar(
          content: Text("Quiz Completed Score $score/4"),
          duration: const Duration(seconds: 5),
          backgroundColor: Colors.blue,
        );
        ScaffoldMessenger.of(ctx).showSnackBar(snackbar);
        reset();
      }
    });
  }

  void reset() {
    setState(() {
      n = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text("Simple Quiz"),
        centerTitle: true,
      ),
      body: Builder(
        //current context naa widget tree
        builder: (ctx) => Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Score : $score/4",
                    style: const TextStyle(
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () => reset(),
                    child: const Text(
                      "Reset",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(color: Colors.brown),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      que_list[n].que,
                      style: const TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () => checkanswer(true, ctx),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(50, 15, 50, 15),
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                    child: const Text(
                      "True",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => checkanswer(false, ctx),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(50, 15, 50, 15),
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text(
                      "False",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
