import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ride_share/core/theme/components/rs_color.dart';

import 'custom_gradient_border.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool? autofocus;
  final bool? readOnly;
  final bool? obscureText;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final String? Function(String?)? validator;
  final MouseCursor? mouseCursor;
  final bool? filled;
  final Color? fillColor;
  final Widget? icon;
  final Color? iconColor;
  final Widget? helper;
  final String? hintText;
  final TextStyle? hintStyle;
  final bool? enabled;
  final Duration? hintFadeDuration;
  // final Widget? error;
  final String? errorText;
  final EdgeInsetsGeometry? contentPadding;
  final IconData? suffixIcon;
  final Widget? suffix;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final void Function(PointerDownEvent)? onTapOutside;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onEditingComplete;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.style,
    this.strutStyle,
    this.textDirection,
    this.textAlign = TextAlign.start,
    this.textAlignVertical = TextAlignVertical.center,
    this.autofocus = false,
    this.readOnly = false,
    this.obscureText = false,
    this.minLines,
    this.maxLines = 1,
    this.maxLength,
    this.validator,
    this.mouseCursor,
    this.filled = true,
    this.fillColor ,
    this.icon,
    this.suffix,
    this.iconColor,
    this.helper,
    this.hintText = "Ride Share",
    this.hintStyle,
    this.enabled = true,
    this.hintFadeDuration,
    // this.error,
    this.errorText,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    this.suffixIcon,
    this.onTap,
    this.onChanged,
    this.onSaved,
    this.onTapOutside,
    this.onFieldSubmitted,
    this.onEditingComplete,

  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      style: style ?? Theme.of(context).textTheme.bodyMedium, // This is default regular text.
      strutStyle: strutStyle,// This use for text align, bold, italic, vertical align etc.
      textDirection: textDirection, // This use to text direction left or right side.
      textAlign: textAlign ?? TextAlign.start,
      textAlignVertical: textAlignVertical,
      autofocus: autofocus ?? true,
      readOnly: readOnly ?? false,
      obscureText: obscureText ?? false,
      autocorrect: false,
      minLines: minLines,
      maxLines: maxLines,
      maxLength: maxLength,
      validator: validator,
      mouseCursor: mouseCursor,
      decoration: InputDecoration(
        filled: filled,
        fillColor: fillColor ?? RsColor.primaryFirst.withOpacity(0.15),
        icon: icon, // This is left side show icon separate some gap between.
        iconColor: iconColor, // This is left side icon color.a
        helper: helper, // I want to show horizontal container of error, warring, success when user type text then it will observe user text and show according to color like error color red.
        hintText: hintText,
        hintStyle: hintStyle ?? Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        hintFadeDuration: hintFadeDuration,
        enabled: enabled ?? false,
        // error: error, // This property will take place of "Helper Widget".
        errorText: errorText,
        contentPadding: contentPadding, 
        suffixIcon: suffix ?? ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              colors: [RsColor.primaryFirst, RsColor.primarySecond],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ).createShader(bounds);
          },
          child: Icon(
            suffixIcon ?? Icons.email,
            size: 24,
            color: Colors.white, // This will be masked by the gradient
          ),
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: RsColor.trans,  width: 0.3),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: RsColor.trans,  width: 0.3),
        ),

        focusedBorder:CustomGradientBorder(
          gradient: LinearGradient(
            colors: [RsColor.primaryFirst.withOpacity(0.8), RsColor.primarySecond.withOpacity(0.6)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: RsColor.redMain,
              width: 1
          ),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: RsColor.redMain,
            width: 1
          ),
        ),

      ),
      onTap: onTap,
      onChanged: onChanged,
      onSaved: onSaved,
      onTapOutside: onTapOutside ?? (v) => FocusScope.of(context).unfocus(),
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
    );
  }
}
