import 'package:flutter/material.dart';
import 'package:solid_test/home_page.dart';

/// App that uses Material Design
class SolidTestApp extends StatelessWidget {
  /// Creates Material Design application
  const SolidTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
