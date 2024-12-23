import 'package:flutter/material.dart';

class CustomRoundedContainer extends StatelessWidget {
  const CustomRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius,
    this.child,
    this.showBorder = false,
    this.borderColor,
    this.backgroundColor,
    this.padding,
    this.margin,
    this.boxShadow,
    this.onTap,
    this.imagePath, // New optional parameter for the image path
  });

  final double? width;
  final double? height;
  final double? radius;
  final Widget? child;
  final bool showBorder;
  final Color? borderColor;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool? boxShadow;
  final VoidCallback? onTap;
  final String? imagePath; // Optional parameter for the image path

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 10),
          boxShadow: boxShadow == true
              ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6.0,
              offset: const Offset(0, 2),
            ),
          ]
              : null,
          color: backgroundColor,
          image: imagePath != null
              ? DecorationImage(
            image: AssetImage(imagePath!), // Uses the image if path is provided
            fit: BoxFit.cover, // You can change the fit according to your needs
          )
              : null,
          border: showBorder
              ? Border.all(
            color: borderColor ?? Colors.transparent,
          )
              : null,
        ),
        child: child,
      ),
    );
  }
}
