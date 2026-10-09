import 'package:flutter/material.dart';
import 'screens/profiles_screen.dart';

void main() {
  runApp(const NadaApp());
}

class NadaApp extends StatelessWidget {
  const NadaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nada',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const ProfilesScreen(),
    );
  }
}