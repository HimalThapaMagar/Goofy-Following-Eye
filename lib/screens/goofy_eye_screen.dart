// import 'dart:math';
// import 'package:flutter/material.dart';

// class GoofyEyeScreen extends StatefulWidget {
//   const GoofyEyeScreen({super.key});

//   @override
//   _GoofyEyeScreenState createState() => _GoofyEyeScreenState();
// }

// class _GoofyEyeScreenState extends State<GoofyEyeScreen> {
//   Offset mousePosition = Offset.zero;

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onHover: (event) {
//         setState(() {
//           mousePosition = event.localPosition;
//         });
//       },
//       // this was only for one eye since I am adding two eyes I need to refactor and make some chanegs
//       // child: Center(
//       //   child: Stack(
//       //     alignment: Alignment.center,
//       //     children: [
//       //       // Eye
//       //       Container(
//       //         width: 100,
//       //         height: 100,
//       //         decoration: BoxDecoration(
//       //           color: Colors.white,
//       //           shape: BoxShape.circle,
//       //           border: Border.all(color: Colors.black, width: 5),
//       //         ),
//       //       ),
//       //       // Pupil
//       //       Pupil(mousePosition: mousePosition),
//       //     ],
//       //   ),
//       // ),
//       child: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             GoofyEye(mousePosition: mousePosition),
//             const SizedBox(width: 50),
//             GoofyEye(mousePosition: mousePosition),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class GoofyEye extends StatelessWidget {
//   final Offset mousePosition;

//   const GoofyEye({super.key, required this.mousePosition});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         // Eye
//         Container(
//           width: 100,
//           height: 100,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             shape: BoxShape.circle,
//             border: Border.all(color: Colors.black, width: 5),
//           ),
//         ),
//         // Pupil
//         Pupil(mousePosition: mousePosition),
//       ],
//     );
//   }
// }

// class Pupil extends StatelessWidget {
//   final Offset mousePosition;

//   const Pupil({super.key, required this.mousePosition});

//   @override
//   Widget build(BuildContext context) {
//     // Eye center
//     final double eyeCenterX = MediaQuery.of(context).size.width / 2;
//     final double eyeCenterY = MediaQuery.of(context).size.height / 2;

//     // Calculate angle and distance from center
//     final double dx = mousePosition.dx - eyeCenterX;
//     final double dy = mousePosition.dy - eyeCenterY;
//     final double angle = atan2(dy, dx);
//     const double maxDistance = 10.0;

//     final double distance = min(sqrt(dx * dx + dy * dy), maxDistance);

//     // Calculate the pupil position based on angle and distance
//     final Offset pupilPosition = Offset(
//       distance * cos(angle),
//       distance * sin(angle),
//     );

//     return Transform.translate(
//       offset: pupilPosition,
//       child: Container(
//         width: 30,
//         height: 30,
//         decoration: const BoxDecoration(
//           color: Colors.black,
//           shape: BoxShape.circle,
//         ),
//       ),
//     );
//   }
// }

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
      child: Stack(
        children: [
          Positioned(
            top: 100, // Adjust this to move the eyes
            // left: 100, // Adjust this to move the eyes
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GoofyEye(mousePosition: mousePosition),
                const SizedBox(width: 50), // Space between the two eyes
                GoofyEye(mousePosition: mousePosition),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GoofyEye extends StatelessWidget {
  final Offset mousePosition;

  const GoofyEye({super.key, required this.mousePosition});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Eye
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 5),
          ),
        ),
        // Pupil
        Pupil(mousePosition: mousePosition),
      ],
    );
  }
}

class Pupil extends StatelessWidget {
  final Offset mousePosition;

  const Pupil({super.key, required this.mousePosition});

  @override
  Widget build(BuildContext context) {
    // Find the center of this eye widget
    final RenderBox eyeBox = context.findRenderObject() as RenderBox;
    final Offset eyeCenter = eyeBox.localToGlobal(Offset.zero) +
        Offset(eyeBox.size.width / 2, eyeBox.size.height / 2);

    // Calculate angle and distance from the center of the eye
    final double dx = mousePosition.dx - eyeCenter.dx;
    final double dy = mousePosition.dy - eyeCenter.dy;
    final double angle = atan2(dy, dx);
    const double maxDistance = 10.0;

    final double distance = min(sqrt(dx * dx + dy * dy), maxDistance);

    // Calculate the pupil position based on angle and distance
    final Offset pupilPosition = Offset(
      distance * cos(angle),
      distance * sin(angle),
    );

    return Transform.translate(
      offset: pupilPosition,
      child: Container(
        width: 30,
        height: 30,
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
