import 'package:flutter/material.dart';
import 'package:ride_share/core/theme/components/rs_color.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class CustomDividerRow extends StatelessWidget {
  const CustomDividerRow({
    super.key,
    this.divText = "or",
  });
  final String? divText;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Expanded(child: Divider(
          color: Theme.of(context).colorScheme.onPrimary,
           thickness: 0.4,
        )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GradientText(
            divText ?? "or",
            style: Theme.of(context).textTheme.bodySmall,
            colors: [RsColor.primaryFirst,RsColor.primarySecond],
          ),
        ),
         Expanded(child: Divider(
          color: Theme.of(context).colorScheme.onPrimary,
          thickness: 0.4,
        ))
      ],
    );
  }
}
