import 'dart:math';
import 'package:flutter/material.dart';

/// Main page of app that change background color on user`s tap
class HomePage extends StatefulWidget {
  /// Creates main page of app
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Color? bgColor;
  int colorChangesNumber = 0;
  final Random random = Random();

  void updateBgColor() {
    final generatedAlpha = random.nextInt(256);
    final generatedRed = random.nextInt(256);
    final generatedGreen = random.nextInt(256);
    final generatedBlue = random.nextInt(256);

    final newBgColor = Color.fromARGB(
      generatedAlpha,
      generatedRed,
      generatedGreen,
      generatedBlue,
    );

    setState(() {
      bgColor = newBgColor;
      colorChangesNumber++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: GestureDetector(
        onTap: updateBgColor,
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Hello there",
                style: TextStyle(
                  color: bgColor == null ? Colors.black : Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    const WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                    ),
                    const WidgetSpan(
                      child: SizedBox(
                        width: 8,
                      ),
                    ),
                    TextSpan(
                      text: "You changed background color $colorChangesNumber "
                          "${colorChangesNumber == 1 ? "time" : "times"}",
                      style: TextStyle(
                        color: bgColor == null ? Colors.black : Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
