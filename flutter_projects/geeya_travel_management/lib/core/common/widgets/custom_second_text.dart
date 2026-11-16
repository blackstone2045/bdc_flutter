import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_sizes.dart';

class CustomSecondText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final int? maxLines;
  final double? decorationThickness;
  final TextOverflow? textOverflow;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final double? letterSpacing;
  final double? lineHeight;

  const CustomSecondText({
    super.key,
    required this.text,
    this.textAlign,
    this.decorationThickness,
    this.maxLines,
    this.textOverflow,
    this.fontSize,
    this.fontWeight,
    this.decoration,
    this.decorationColor,
    this.color,
    this.letterSpacing,
    this.lineHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.lato(
        decoration: decoration,
        decorationThickness: decorationThickness,
        decorationColor: decorationColor,
        fontSize: fontSize ?? getWidth(14),
        color: color ?? AppColors.textPrimary,
        fontWeight: fontWeight ?? FontWeight.w400,
        letterSpacing: letterSpacing,
        height: lineHeight,
      ),
      overflow: textOverflow,
      maxLines: maxLines,
    );
  }
}
