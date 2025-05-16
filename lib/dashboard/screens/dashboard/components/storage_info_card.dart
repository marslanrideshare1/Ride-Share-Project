import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_share/core/theme/components/rs_color.dart';

import '../../../constants.dart';

class StorageInfoCard extends StatelessWidget {
  const StorageInfoCard({
    super.key,
    required this.title,
    required this.svgSrc,
    required this.amountOfFiles,
    required this.numOfFiles,
  });

  final String title, svgSrc, amountOfFiles;
  final String numOfFiles;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultPadding),
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.6)),
        borderRadius: const BorderRadius.all(
          Radius.circular(defaultPadding),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 20,
            width: 20,
            child: SvgPicture.asset(svgSrc),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 10,fontWeight: FontWeight.bold),
                  ),
                  Text(
                    numOfFiles,

                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!.copyWith(fontSize: 8),
                  ),
                ],
              ),
            ),
          ),
          Text(amountOfFiles, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 8,fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
