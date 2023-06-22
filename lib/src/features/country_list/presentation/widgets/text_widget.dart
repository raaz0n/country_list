import 'package:flutter/material.dart';

class BuildText extends StatelessWidget {
  const BuildText(
      {Key? key,
      this.text = "",
      this.fontSize = 14.0,
      this.color = Colors.black,
      this.weight = FontWeight.w400,
      this.family,
      this.decoration = TextDecoration.none,
      this.textAlign = TextAlign.start,
      this.maxLines,
      this.overFlow,
      this.lineHeight,
      this.italics = false})
      : super(key: key);

  final String text;
  final double fontSize;
  final double? lineHeight;
  final Color color;
  final FontWeight weight;
  final TextDecoration decoration;
  final TextAlign textAlign;
  final int? maxLines;
  final bool italics;
  final String? family;
  final TextOverflow? overFlow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overFlow,
      softWrap: true,
      style: TextStyle(
        fontWeight: weight,
        fontSize: fontSize,
        color: color,
        fontStyle: italics ? FontStyle.italic : FontStyle.normal,
        decoration: decoration,
        fontFamily: family,
        height: lineHeight,
      ),
    );
  }
}
