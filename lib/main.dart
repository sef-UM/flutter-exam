import 'package:flutter/material.dart';
import 'package:orion_flutter_exam/pages/socialmedia.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Socmed_page(),
    );
  }
}
