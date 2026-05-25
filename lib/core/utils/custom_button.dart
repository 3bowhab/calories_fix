import 'package:calories_fix/core/theme/app_colors.dart';
import 'package:calories_fix/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? label;
  final bool isGoogleButton;
  final Widget? labelWidget;
  final Widget? icon;
  final Color? backgroundColor;
  final Color? borderSideColor;
  const CustomButton({
    super.key,
    required this.onPressed,
    this.label,
    this.icon,
    this.backgroundColor,
    this.borderSideColor,
    this.isGoogleButton = false, 
    this.labelWidget,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      label: isGoogleButton
          ? labelWidget!
          : Text(
              label!,
              style: context.semiBold20.copyWith(color: AppColors.whiteColor),
            ),
      icon: icon ?? SizedBox.shrink(),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        side: BorderSide(color: borderSideColor ?? Colors.transparent),
      ),
    );
  }
}
