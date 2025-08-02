import 'package:flutter/material.dart';
import 'package:slicing_design/helper/size_customize.dart';
import 'package:slicing_design/style/colors.dart';

class CustomizeButton extends StatelessWidget {
  const CustomizeButton({
    super.key,
    VoidCallback? function,
    required Widget widget,
    BorderRadius? borderRadius,
    Color? overlayColor,
    Color? backgroundColor,
    double? paddingVertical,
    BorderSide? borderSide,
    double? width,
    OutlinedBorder? shape,
  }) : _function = function,
       _widget = widget,
       _borderRadius = borderRadius,
       _overlayColor = overlayColor,
       _backgroundColor = backgroundColor,
       _paddingVertical = paddingVertical,
       _borderSide = borderSide,
       _width = width,
       _shape = shape;
  final VoidCallback? _function;
  final Widget _widget;
  final BorderRadius? _borderRadius;
  final Color? _overlayColor;
  final Color? _backgroundColor;
  final double? _paddingVertical;
  final BorderSide? _borderSide;
  final double? _width;
  final OutlinedBorder? _shape;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width,
      child: ClipRRect(
        borderRadius:
            _borderRadius ?? SizeCustomize.borderRadiusCircular(all: 10),
        child: TextButton(
          onPressed: _function,
          style: ButtonStyle(
            padding: WidgetStatePropertyAll(
              EdgeInsets.symmetric(vertical: _paddingVertical ?? 0),
            ),
            backgroundColor: WidgetStatePropertyAll(
              _backgroundColor ?? Color(0xFF1F1D47).withValues(alpha: 0.8),
            ),
            enableFeedback: true,
            overlayColor: WidgetStatePropertyAll(
              _overlayColor ?? AppColors.overlayColor.withValues(alpha: 0.1),
            ),
            shape: WidgetStatePropertyAll(
              _shape ??
                  RoundedRectangleBorder(
                    side: _borderSide ?? BorderSide.none,
                    borderRadius:
                        _borderRadius ??
                        SizeCustomize.borderRadiusCircular(all: 10),
                  ),
            ),
          ),
          child: _widget,
        ),
      ),
    );
  }
}
