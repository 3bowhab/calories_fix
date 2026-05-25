import 'package:calories_fix/core/extensions/responsive_padding_extension.dart';
import 'package:calories_fix/core/extensions/responsive_size_extension.dart';
import 'package:calories_fix/core/theme/app_colors.dart';
import 'package:calories_fix/core/theme/app_text_styles.dart';
import 'package:calories_fix/l10n/app_localizations.dart';
import 'package:calories_fix/providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextQuote extends StatelessWidget {
  const TextQuote({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);

    return Container(
      width: 230.width,
      height: 120.height,
      padding: 5.allPadding,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Row(
        children: [
          Column(
            children: [
              languageProvider.currentLanguage == 'ar'
                  ? Transform.flip(
                      flipY: true,
                      child: Icon(
                        Icons.format_quote,
                        color: AppColors.firstColor,
                      ),
                    )
                  : Transform.flip(
                      flipY: true,
                      flipX: true,
                      child: Icon(
                        Icons.format_quote,
                        color: AppColors.firstColor,
                      ),
                    ),
            ],
          ),
          Expanded(
            child: Text(
              AppLocalizations.of(context)!.textQuote,
              textAlign: TextAlign.center,
              style: context.semiBold12,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              languageProvider.currentLanguage == 'ar'
                  ? Transform.flip(
                      // flipY: true,
                      flipX: true,
                      child: Icon(
                        Icons.format_quote,
                        color: AppColors.firstColor,
                      ),
                    )
                  : Icon(Icons.format_quote, color: AppColors.firstColor),
            ],
          ),
        ],
      ),
    );
  }
}
