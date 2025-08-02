import 'package:flutter/material.dart';
import 'package:slicing_design/helper/size_customize.dart';
import 'package:slicing_design/style/colors.dart';

class TitleText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? colors;
  final FontWeight? weight;
  final TextOverflow? overflow;
  final int? maxLine;
  const TitleText({
    super.key,
    required this.text,
    this.size,
    this.colors,
    this.weight,
    this.overflow = TextOverflow.ellipsis,
    this.maxLine,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size ?? SizeCustomize.setSp(16),
        color: colors ?? AppColors.subtextColor1,
        fontFamily: 'Poppins',
        fontWeight: weight ?? FontWeight.w500,
      ),
      overflow: overflow,
      maxLines: maxLine,
    );
  }
}

class SubText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? colors;
  final FontWeight? weight;
  final TextOverflow? overflow;
  final int? maxLine;
  final TextAlign? align;
  final TextScaler? scale;
  const SubText({
    super.key,
    required this.text,
    this.size,
    this.colors,
    this.weight,
    this.overflow = TextOverflow.ellipsis,
    this.maxLine,
    this.align,
    this.scale,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size ?? SizeCustomize.setSp(14),
        color: colors ?? AppColors.subtextColor1,
        fontFamily: 'Poppins',
        fontWeight: weight ?? FontWeight.w400,
      ),
      textScaler: scale,
      overflow: overflow,
      textAlign: align,
      maxLines: maxLine ?? 2,
    );
  }
}
