import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText(
      {super.key,
      required this.text,
      this.size,
      this.color,
      this.weight,
      this.decoration,
      this.align,
      this.overflow,
      this.maxLines});
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final TextDecoration? decoration;
  final TextAlign? align;
  final TextOverflow? overflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: weight,
          decoration: decoration,
        ),
        textAlign: align,
        overflow: overflow,
        maxLines: maxLines,
      ).tr();
}
