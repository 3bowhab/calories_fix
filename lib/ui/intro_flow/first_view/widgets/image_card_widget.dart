import 'package:calories_fix/core/constants/app_images.dart';
import 'package:calories_fix/core/extensions/responsive_size_extension.dart';
import 'package:calories_fix/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ImageCardWidget extends StatelessWidget {
  const ImageCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 300.height,
          width: 300.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.firstColorAlt, AppColors.titleColor],
            ),
            borderRadius: BorderRadius.circular(70),
          ),
        ),

        Positioned(
          bottom: 0,
          child: ShaderMask(
            shaderCallback: (rect) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.titleColor, Colors.transparent],
                stops: const [0.8, 1.0],
              ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
            },
            blendMode: BlendMode.dstIn,
            child: Image.asset(
              Assets.assetsImagesHearo,
              height: 350.height,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
