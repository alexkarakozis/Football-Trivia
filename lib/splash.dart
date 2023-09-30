import 'package:flutter/material.dart';
import 'dart:math';
import 'package:playerid/home.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 7),
    );
    animationController.repeat();
    _naviagetohome();
  }

  void _naviagetohome() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            color: Color.fromRGBO(9, 20, 66, 1),
            child: Column(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
              ),
              AnimatedBuilder(
                animation: animationController,
                child: SizedBox(
                  height: 150.0,
                  width: 150.0,
                  child: Image.asset('images/football.png'),
                ),
                builder: (BuildContext context, Widget? widget) {
                  return Transform.rotate(
                    angle: animationController.value * 2 * pi,
                    child: widget,
                  );
                },
              ),
              Text(
                "Loading ...",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              )
            ])));
  }
}
