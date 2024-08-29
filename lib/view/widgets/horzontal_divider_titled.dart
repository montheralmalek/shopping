import 'package:flutter/material.dart';

class HorzontalDivdierTitled extends StatelessWidget {
  const HorzontalDivdierTitled(
      {super.key,
      required this.text,
      this.indent,
      this.endIndent,
      this.color,
      this.thickness,
      this.height});
  final String text;
  final double? indent;
  final double? endIndent;
  final double? thickness;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            indent: indent,
            endIndent: 8,
            thickness: thickness,
            height: height,
            color: color?.withOpacity(0.6),
          ),
        ),
        Text(
          text,
          style: TextStyle(color: color),
        ),
        Expanded(
          child: Divider(
            indent: 8,
            endIndent: endIndent,
            thickness: thickness,
            height: height,
            color: color?.withOpacity(0.6),
          ),
        ),
      ],
    );
  }
}
