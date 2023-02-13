import 'package:flutter/material.dart';
import '../core/theme/app_color.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.height = 52,
    this.borderRadius = 8,
    this.elevation = 0,
    this.padding = const EdgeInsets.symmetric(
      vertical: 16,
      horizontal: 12,
    ),
    this.labelColor,
  });
  final double height;
  final double borderRadius;
  final double elevation;
  final EdgeInsetsGeometry padding;
  final String label;
  final Color? labelColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context).extension<AppColor>()!;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: appColor.primaryColor,
        foregroundColor: appColor.background1,
        disabledBackgroundColor: appColor.primaryColor.withOpacity(0.5),
        disabledForegroundColor: appColor.background1,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide.none,
        ),
        padding: padding,
        minimumSize: Size.fromHeight(height),
        shadowColor: Colors.transparent,
      ),
      child: Center(
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelLarge!.apply(
                color: appColor.background1,
              ),
        ),
      ),
    );
  }
}
