import 'package:flutter/material.dart';
import 'package:playerid/user_tracker.dart';
import 'package:playerid/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserTracker.init();

  runApp(
    MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(9, 20, 66, 1),
        useMaterial3: true,
      ),
      home: Splash(),
    ),
  );
}
