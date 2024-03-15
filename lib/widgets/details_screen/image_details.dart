import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

import '../../assets.dart';

/// Image builder for official art image at details
class ImageDetails extends StatelessWidget {
  final String? imageUrl;
  final bool animated;

  const ImageDetails({super.key, this.imageUrl, this.animated = false});

  @override
  Widget build(BuildContext context) {
    if (imageUrl != null) {
      return SizedBox(
        height: 300,
        width: 300,
        child: Image.network(
          imageUrl!, scale: animated ? 0.4 : 1,
          loadingBuilder: (context, child, loadingProgress) =>
          loadingProgress == null
              ? child
              : Center(child: Padding(
                padding: const EdgeInsets.all(150.0),
                child: Lottie.asset(Assets.pokeballAnim),
              )),
          errorBuilder: (context, error, stackTrace) =>
              Image.asset(Assets.substitute),
        ).animate(
            effects: [const FadeEffect(duration: Duration(milliseconds: 300))]),
      );
    } else {
      return SizedBox(
        height: 300,
        width: 300,
        child: Padding(
            padding: const EdgeInsets.all(90),
            child: Lottie.asset(Assets.pokeballAnim)),
      );
    }
  }
}