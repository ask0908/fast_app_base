import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? margin;
  final EdgeInsets padding;
  final double radiusValue;
  final Color? color;
  final BorderRadiusGeometry? radius;

  const RoundedContainer({
    required this.child,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 15,
    ),
    this.margin,
    this.radius,
    this.radiusValue = 20,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color ?? context.appColors.roundedLayoutBackground,
        borderRadius: radius ?? BorderRadius.circular(radiusValue),
      ),
      child: child,
    );
  }
}