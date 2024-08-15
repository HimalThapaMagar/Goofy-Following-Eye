import 'dart:math';
import 'package:flutter/material.dart';

class GoofyEyeScreen extends StatefulWidget {
  const GoofyEyeScreen({super.key});

  @override
  _GoofyEyeScreenState createState() => _GoofyEyeScreenState();
}

class _GoofyEyeScreenState extends State<GoofyEyeScreen> {
  Offset mousePosition = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onHover: (event) {
          setState(() {
            mousePosition = event.localPosition;
          });
        },
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Eye
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 5),
                ),
              ),
              // Pupil
              Pupil(mousePosition: mousePosition),
            ],
          ),
        ),
      );
  }
}

class Pupil extends StatelessWidget {
  final Offset mousePosition;

  const Pupil({super.key, required this.mousePosition});

  @override
  Widget build(BuildContext context) {
    // Eye center
    final double eyeCenterX = MediaQuery.of(context).size.width / 2;
    final double eyeCenterY = MediaQuery.of(context).size.height / 2;

    // Calculate angle and distance from center
    final double dx = mousePosition.dx - eyeCenterX;
    final double dy = mousePosition.dy - eyeCenterY;
    final double angle = atan2(dy, dx);
    const double maxDistance = 40.0;

    final double distance = min(sqrt(dx * dx + dy * dy), maxDistance);

    // Calculate the pupil position based on angle and distance
    final Offset pupilPosition = Offset(
      distance * cos(angle),
      distance * sin(angle),
    );

    return Transform.translate(
      offset: pupilPosition,
      child: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
