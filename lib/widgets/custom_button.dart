import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_share/core/theme/components/rs_color.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double borderRadius;
  final bool isDisabled;
  final TextStyle? textStyle;
  final List<Color>? gradientColors;
  final AlignmentGeometry? gradientBegin;
  final AlignmentGeometry? gradientEnd;
  final Widget? icon;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final BoxConstraints? constraints;
  final bool fullWidth;
  final bool isLoading;
  final void Function()? onLongPress;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.width,
    this.height,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderRadius = 10,
    this.isDisabled = false,
    this.textStyle,
    this.gradientColors,
    this.gradientBegin = Alignment.centerLeft,
    this.gradientEnd = Alignment.centerRight,
    this.icon,
    this.elevation,
    this.padding,
    this.constraints,
    this.fullWidth = false, // New parameter to control full width behavior
    this.isLoading = false,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate dimensions
    final buttonWidth = fullWidth
        ? double.infinity  // Will expand to parent's width
        : width ?? 300.0;  // Default fixed width or custom width

    final buttonHeight = height ?? 50.0; // Fixed height

    // Determine colors based on state
    final bgColor = isDisabled
        ? (backgroundColor ?? RsColor.grey)
        : (backgroundColor ?? RsColor.primaryFirst);

    // Border color
    final brdColor = borderColor ?? Colors.transparent;

    return Opacity(
      opacity: isDisabled ? 0.6 : 1.0,
      child: Container(
        constraints: constraints ?? BoxConstraints(
          minWidth: buttonWidth,
          maxWidth: fullWidth ? double.infinity : buttonWidth,
          minHeight: buttonHeight,
        ),
        decoration: BoxDecoration(
          color: gradientColors == null ? bgColor : null,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: brdColor),
          gradient: gradientColors != null
              ? LinearGradient(
            colors: gradientColors!,
            begin: gradientBegin!,
            end: gradientEnd!,
          )
              : null,
          boxShadow: elevation != null
              ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: elevation!,
              offset: const Offset(0, 2),
            )
          ]
              : null,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(borderRadius),
            onLongPress: onLongPress,
            onTap: isDisabled ? null : onPressed,
            child: Padding(
              padding: padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    icon!,
                    const SizedBox(width: 8),
                  ],
                  SizedBox(width: 10,),
                  Flexible(
                    child:  isLoading == true ? CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ) : Text(
                      text,
                      style: (textStyle ?? Theme.of(context).textTheme.bodyMedium)?.copyWith(
                        color: textColor,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}