import 'package:flutter/material.dart';
import 'package:app/tugas/tugas2.dart';
 
void main() => runApp(const MyApp());
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;

    return MaterialApp(
      title: 'Tugas 2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: brightness,
      ),
      home: const Tugas2(),
    );
  }
}