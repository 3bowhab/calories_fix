import 'package:calories_fix/core/extensions/responsive_padding_extension.dart';
import 'package:calories_fix/core/extensions/responsive_size_extension.dart';
import 'package:calories_fix/ui/intro_flow/first_view/widgets/image_card_widget.dart';
import 'package:calories_fix/ui/intro_flow/first_view/widgets/number_card.dart';
import 'package:calories_fix/ui/intro_flow/first_view/widgets/text_quote.dart';
import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 60.topPadding,
      child: SizedBox(
        width: double.infinity,
        height: 350.height,
        child: Stack(
          alignment: AlignmentGeometry.center,
          children: [
            Align(
              alignment: AlignmentGeometry.topCenter,
              child: ImageCardWidget(),
            ),
            Align(
              alignment: AlignmentGeometry.topLeft,
              child: NumberCard(),
            ),
            Align(
              alignment: AlignmentGeometry.bottomRight,
              child: TextQuote(),
            ),
          ],
        ),
      ),
    );
  }
}