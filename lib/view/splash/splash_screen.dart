import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  // navigate() {
  //   Future.delayed(const Duration(seconds: 3), () {
  //     Navigator.pushAndRemoveUntil(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => const HomeScreen(),
  //         ),
  //         (route) => false);
  //   });
  // }

  @override
  void initState() {
    fadeInAnimation();
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    });
  }

  bool isAnimate = false;
  AnimationController? controller;
  Animation<double>? animation;

  fadeInAnimation() {
    controller = AnimationController(
        duration: Duration(milliseconds: 1500), vsync: this);
    animation = CurvedAnimation(parent: controller!, curve: Curves.easeIn);
    Future.delayed(Duration(milliseconds: 400), () => controller!.forward());
  }

  iconAnimation() =>
      Future.delayed(Duration(milliseconds: 100), () => isAnimate = true);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double screenWidth = size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png", width: screenWidth / 2),
            SizedBox(
              height: screenHeight / 20,
            ),
            FadeTransition(
              opacity: animation!,
              child: const Text(
                "welcome To Do App",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.deepPurple,
                  fontSize: 25,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
