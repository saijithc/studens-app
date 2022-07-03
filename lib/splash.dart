import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'home.dart';
class SplashScreen extends StatelessWidget {
 const SplashScreen({Key? key}) : super(key: key);
 @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(splashIconSize: MediaQuery.of(context).size.height*0.25,
      splash: 'assets/brototype.jpg',
      nextScreen: const HomeScreen(),
      splashTransition: SplashTransition.rotationTransition,
      // pageTransitionType: PageTransitionType.scale,
    );
  }
}


