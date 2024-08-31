import 'package:flutter/material.dart';
import 'package:plant_ui/screens/home/home_screen.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant App',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: kPrimaryColor,
        ),
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
} /*VisualDensity adaptivePlatformDensity. Returns a VisualDensity that is adaptive based on the current platform on which the framework is executing, from defaultTargetPlatform. When defaultTargetPlatform is a desktop platform, this returns compact, and for other platforms, it returns a default-constructed VisualDensity.*/
