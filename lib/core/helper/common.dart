import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../theme/components/rs_color.dart';

class Common{
  Common._();

  static changeFocusOfField(BuildContext context, FocusNode originFocusNode,
      FocusNode? destinationFocusNode) {
    originFocusNode.unfocus();
    destinationFocusNode != null
        ? FocusScope.of(context).requestFocus(destinationFocusNode)
        : null;
  }
  static Row customRichText(BuildContext context,{String? title, subTitle, void Function()? onTap}) {
    return Row(
      children: [
        Spacer(),
        Center(
            child: Text(title ?? "Don't have an account? ", style: Theme.of(context).textTheme.bodySmall)
        ),
        GestureDetector(
          onTap: onTap,
          child: Center(
            child: GradientText(
              subTitle ?? 'Sign up',
              style: Theme.of(context).textTheme.bodyLarge,
              gradientType: GradientType.linear,
              radius: 2.5,
              colors: [RsColor.primaryFirst, RsColor.primarySecond],
            ),
          ),
        ),
      ],
    );
  }
}