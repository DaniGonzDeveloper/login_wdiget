import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DefaultText extends StatelessWidget {
  final String text;
  final int? maxLines;
  final TextOverflow? overflow;
  final Color color;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final double? textScaleFactor;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? fontSize;
  final TextDecoration? textDecoration;

  const DefaultText({
    Key? key,
    required this.text,
    this.maxLines = 1,
    this.color = Colors.white,
    this.textStyle,
    this.textAlign,
    this.textScaleFactor,
    this.fontWeight = FontWeight.normal,
    this.fontStyle = FontStyle.normal,
    this.overflow = TextOverflow.ellipsis,
    this.textDecoration,
    this.fontSize = 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      textDirection: TextDirection.ltr,
      style: textStyle != null
          ? textStyle!.copyWith(
              color: color, fontWeight: fontWeight, fontSize: fontSize)
          : TextStyle(
              color: color,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              fontSize: fontSize,
              decoration: textDecoration,
            ),
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      textScaleFactor: textScaleFactor,
    );
  }
}