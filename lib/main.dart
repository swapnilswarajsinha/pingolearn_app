import 'package:flutter/material.dart';
import 'package:pingolearn_app/screens/HomePage/homepage_screen.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pingo Learn - Round 1',
      home: HomePageScreen(),
    );
  }
}
