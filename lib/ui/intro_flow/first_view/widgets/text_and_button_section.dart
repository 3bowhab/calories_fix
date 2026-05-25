import 'package:calories_fix/core/constants/app_routes.dart';
import 'package:calories_fix/core/extensions/responsive_padding_extension.dart';
import 'package:calories_fix/core/extensions/responsive_sized_box_extension.dart';
import 'package:calories_fix/core/theme/app_colors.dart';
import 'package:calories_fix/core/theme/app_text_styles.dart';
import 'package:calories_fix/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class TextAndButtonSection extends StatelessWidget {
  const TextAndButtonSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 16.horizontalPadding,
      child: Column(
        children: [
          10.verticalSizedBox,
          RichText(
            text: TextSpan(
              text: AppLocalizations.of(context)!.fixYourCalories,
              style: context.black40.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
              children: [
                TextSpan(
                  text: AppLocalizations.of(context)!.fuelYourBody,
                  style: context.black40.copyWith(
                    color: AppColors.firstColor,
                  ),
                ),
              ],
            ),
          ),
    
          10.verticalSizedBox,
          Text(
            AppLocalizations.of(context)!.homeDiscription,
            style: context.regular16.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
    
          30.verticalSizedBox,
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.onboardingsView);
            },
            child: Text(
              AppLocalizations.of(context)!.orderYourMealsNow,
              style: context.bold16.copyWith(
                color: AppColors.whiteColor,
              ),
            ),
          ),
          10.verticalSizedBox,
        ],
      ),
    );
  }
}
