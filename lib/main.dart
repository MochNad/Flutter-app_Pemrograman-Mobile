import 'package:flutter/material.dart';
import 'package:app/tugas/uts/auth.dart';
 
void main() => runApp(const MyApp());
 
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget _homeWidget = const Splash();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 10), () {
      setState(() {
        _homeWidget = const Auth();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;

    return MaterialApp(
      title: 'UTS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: brightness,
      ),
      home: _homeWidget,
    );
  }
}