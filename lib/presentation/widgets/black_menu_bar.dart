import 'package:flutter/material.dart';

class PageWithBlackBar extends StatelessWidget {
  final Widget child;
  final double barHeight;

  const PageWithBlackBar({
    Key? key,
    required this.child,
    this.barHeight = 30.0, // Default height for the black bar
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Black bar at the top
          Container(
            width: double.infinity,
            height: barHeight,
            color: Colors.black,
            // Add padding for status bar
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          ),
          // Rest of the content
          Expanded(child: child),
        ],
      ),
    );
  }
}