import 'package:calories_fix/core/extensions/responsive_padding_extension.dart';
import 'package:calories_fix/core/extensions/responsive_size_extension.dart';
import 'package:calories_fix/core/theme/app_colors.dart';
import 'package:calories_fix/core/theme/app_text_styles.dart';
import 'package:calories_fix/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 30.topPadding,
      child: Container(
        width: 170.width,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 5.width),
          horizontalTitleGap: 10,
          leading: Container(
            height: 35.square,
            width: 35.square,
            decoration: BoxDecoration(
              color: AppColors.firstColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.phone,
              color: AppColors.inputBackground,
              size: 20,
            ),
          ),
          title: Text(
            AppLocalizations.of(context)!.phoneNumber,
            style: context.regular12.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          subtitle: Text(
            '+971554340686',
            style: context.semiBold12.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          dense: true,
        ),
      ),
    );
  }
}
