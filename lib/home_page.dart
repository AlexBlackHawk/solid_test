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

  Color getTextColor(Color color) {
    int d = 0;

    final double luminance =
        (0.299 * ((color.r * 255.0).round() & 0xff) +
            0.587 * ((color.g * 255.0).round() & 0xff) +
            0.114 * ((color.b * 255.0).round() & 0xff)) / 255;

    if (luminance >= 0.5) {
      d = 0;
    } else {
      d = 255;
    }

    return Color.fromARGB(255, d, d, d);
  }

  void updateBgColor() {
    final generatedAlpha = Random().nextInt(256);
    final generatedRed = Random().nextInt(256);
    final generatedGreen = Random().nextInt(256);
    final generatedBlue = Random().nextInt(256);

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
                  color: bgColor == null ? Colors.black
                      : getTextColor(bgColor!),
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
                        color: bgColor == null ? Colors.black
                            : getTextColor(bgColor!),
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
