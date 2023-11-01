import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:app/tugas/uts/register.dart';
import 'package:app/tugas/uts/login.dart';
import 'package:app/tugas/uts/default.dart';

final formKey = GlobalKey<FormState>();

bool isShowLogin = false;
bool isShowRegister = false;

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Expanded(
              child: Center(
                child: Image(
                  image: AssetImage('images/icon_64px.png'),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: LoadingAnimationWidget.dotsTriangle(
                          color: foreground,
                          size: 35,
                        ),
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'UTS',
                            style: TextStyle(
                              color: primary,
                              fontSize: 20.0,
                            ),
                          ),
                          Text(
                            'Pemrograman Mobile',
                            style: TextStyle(
                              color: secondary,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            AnimatedPositioned(
              duration: defaultDuration,
              width: size.width * 0.88,
              height: size.height,
              left: isShowLogin ? -size.width * 0.76 : 0,
              child: Container(
                color: background,
                child: const LoginForm(),
              ),
            ),
            AnimatedPositioned(
              duration: defaultDuration,
              width: size.width * 0.88,
              height: size.height,
              left: isShowLogin ? size.width * 0.12 : size.width * 0.88,
              child: Container(
                color: primary,
                child: const RegisterForm(),
              ),
            ),
            AnimatedPositioned(
              duration: defaultDuration,
              height: size.height,
              width: size.width * 0.12,
              left: isShowLogin ? size.width * 0 : size.width * 0.88,
              child: GestureDetector(
                onTap: () {
                  if (isShowLogin) {
                    formLoginKey.currentState?.reset();
                    setState(() {
                      clearControllersLogin();
                      isShowLogin = false;
                      isShowRegister = true;
                    });
                  } else {
                    formRegisterKey.currentState?.reset();
                    setState(() {
                      clearControllersRegistration();
                      isShowLogin = true;
                      isShowRegister = false;
                    });
                  }
                },
                child: Container(
                  color: Colors.transparent,
                  child: Center(
                    child: RotatedBox(
                      quarterTurns: isShowLogin
                          ? 3
                          : 1, // Memutar teks jika isShowLogin false
                      child: Text(
                        isShowLogin ? 'LOGIN' : 'REGISTER',
                        style: const TextStyle(
                          color: foreground,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
