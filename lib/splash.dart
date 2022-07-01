import 'package:flutter/material.dart';


import 'home.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  void initState() {
    gotohome(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset('assets/brototype.jpg')),
    );
  }
}

Future<void> gotohome(BuildContext context) async {
  await Future.delayed(
    Duration(seconds: 3),
  );
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (ctx) => home_screen()));
}
