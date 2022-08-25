import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppText extends StatelessWidget {
  AppText({
    required this.txt,
    required this.size,
    required this.fw,
    required this.color,
    Key? key,
  }) : super(key: key);
  String txt;
  double size;
  FontWeight fw;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
        fontSize: size,
        fontWeight: fw,
        color: color,
      ),
    );
  }
}

// ignore: must_be_immutable
class AppTextWidgtt extends StatelessWidget {
  AppTextWidgtt({
    required this.txt,
    required this.txt2,
    required this.size,
    required this.fw,
    required this.color,
    Key? key,
  }) : super(key: key);
  String txt;
  String txt2;
  double size;
  FontWeight fw;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          txt,
          style: TextStyle(
            fontSize: size,
            fontWeight: fw,
            color: color,
          ),
        ),
        Text(
          txt2,
          style: TextStyle(
            fontSize: size,
            fontWeight: fw,
            color: color,
          ),
        ),
      ],
    );
  }
}
