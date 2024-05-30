import 'package:flutter/material.dart';

class HalfCard extends StatelessWidget {
  const HalfCard({
    super.key,
    this.child,
    this.borderRadius,
    this.boxShadow,
    this.padding,
    this.margin,
    this.height,
    this.backgrounColor,
    this.isShadow = true,
    this.width,
    this.onTap,
    this.shape,
    this.border,
  });

  final Widget? child;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final Color? backgrounColor;
  final bool isShadow;
  final VoidCallback? onTap;
  final BoxShape? shape;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.antiAlias,
      margin: margin ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        border: border,
        shape: shape ?? BoxShape.rectangle,
        color: backgrounColor ??
            (Theme.of(context).brightness == Brightness.light
                ? Colors.white
                : Colors.black54),
        borderRadius: shape == null
            ? (borderRadius ??
                const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ))
            : null,
        boxShadow: isShadow
            ? (boxShadow ??
                const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 3,
                    offset: Offset(0, -3),
                  ),
                ])
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: padding ?? EdgeInsets.zero,
            child: child,
          ),
        ),
      ),
    );
  }
}
