import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
    const Splash({Key ? key}) : super(key: key);

    @override
    _SplashState createState() => _SplashState();
  }

  class _SplashState extends State<Splash> {
    bool _isBig = false;

    @override
    Widget build(BuildContext context) {
      final size = MediaQuery.of(context).size;

      return Scaffold(
        body: GestureDetector(
          onTap: () {
            setState(() {
              _isBig = !_isBig;
            });
          },
          child: Container(
            height: size.height,
            width: size.width,
            color: Colors.white,
            child: Stack(
              children: [
                AnimatedSize(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  child: Container(
                    width: _isBig ? 200 : 100,
                    height: _isBig ? 200 : 100,
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }