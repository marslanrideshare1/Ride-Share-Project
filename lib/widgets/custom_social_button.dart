import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ride_share/core/theme/components/rs_color.dart';

class CustomSocialButton extends StatelessWidget {
  final String? buttonName, imageUrl;
  final Function()? onTap;
  final double? paddingForText, paddingForImage;
  const CustomSocialButton({
     this.buttonName,
    this.imageUrl,
     this.onTap,
    this.paddingForText,
    this.paddingForImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:RsColor.primaryFirst,
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Positioned(
                left: MediaQuery.of(context).size.width * 0.34,
               child: CachedNetworkImage(
                  imageUrl:imageUrl ?? "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/crypto%2Ffacebook%20(2).png?alt=media&token=9c275bf0-2bf7-498a-9405-9ae99df8d8f2",
                  width: 20,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * 0.44,
                child: Text(buttonName ?? "Facebook",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
              ),
            ],
          )),
    );
  }
}
