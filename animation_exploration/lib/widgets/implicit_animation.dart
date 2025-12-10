import 'package:flutter/material.dart';
import 'dart:math';

class ImplicitAnimation extends StatefulWidget {
  const ImplicitAnimation({super.key});

  @override
  State<ImplicitAnimation> createState() => _ImplicitAnimationState();
}

class _ImplicitAnimationState extends State<ImplicitAnimation> {
  var expanded = false;
  var boxWidth = 100.0;
  var boxHeight = 200.0;
  var color = Colors.amber;
  var colorSets = [
    [Colors.red, Colors.yellow, Colors.blue],
    [Colors.pink, Colors.purple, Colors.lightBlue],
  ];
  var gradientIndex = 0;
  var opacity = 1.0;
  var radians = 0.0;
  var scale = 1.0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(padding: EdgeInsetsGeometry.all(100.0)),
          AnimatedSize(
            duration: Duration(milliseconds: 350),
            child: AnimatedContainer(
              duration: Duration(microseconds: 350),
              width: boxWidth,
              height: boxHeight,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 800),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: colorSets[gradientIndex],
                    stops: [0.5, 0.75, 1.0],
                    transform: GradientRotation(pi / 8),
                  ),
                ),
              ),
              // color = color;
            ),
          ),
          AnimatedOpacity(
            opacity: opacity,
            duration: Duration(seconds: 1),
            child: Text('FOO', style: TextStyle(fontSize: 32)),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (expanded) {
                  expanded = false;
                  boxWidth = 200.0;
                  boxHeight = 100.0;
                  color = Colors.teal;
                  gradientIndex = 1;
                  opacity = 0.35;
                } else {
                  expanded = true;
                  boxWidth = 100.0;
                  boxHeight = 200.0;
                  color = Colors.amber;
                  gradientIndex = 0;
                  opacity = 1.0;
                }
              });
            },
            child: Text('Resize'),
          ),
          AnimatedScale(
            scale: scale,
            duration: Duration(seconds: 2),
            curve: Curves.slowMiddle,
            child: AnimatedRotation(
              turns: radians,
              duration: Duration(seconds: 2),
              curve: Curves.easeInOutCubicEmphasized,
              child: Icon(Icons.star, size: 100, color: Colors.lightBlue),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                if (radians == 0.0) {
                  radians = pi / 4;
                  scale = 1.5;
                } else {
                  radians = 0.0;
                  scale = 1.0;
                }
              });
            },
            splashColor: Colors.blueAccent,
            child: Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey, width: 3.0)),
              child: SizedBox(width: 100, height: 50, child: Center(child: Text('Tap me'))),
            ),
          ),
        ],
      ),
    );
  }
}
