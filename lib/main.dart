import 'package:flutter/material.dart';
import 'package:martin_media/landing_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'Sans serif',
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontSize: 20),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        border: OutlineInputBorder(),

      ),
    ),
    home: const LandingPage(),
  ));
}
